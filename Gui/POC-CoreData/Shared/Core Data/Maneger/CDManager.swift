/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import CoreData


class CDManager: NSObject, CoreDataProperties {
        
    /* MARK: - Atributos */
    
    static let shared = CDManager()
    
    
    /* Managers */
    
    private lazy var foodManeger: FoodCDManager = {
        let food = FoodCDManager()
        food.coreDataProperties = self
        return food
    }()
    
    
    private lazy var favoriteManeger: FavoriteCDManager = {
        let favorite = FavoriteCDManager()
        favorite.coreDataProperties = self
        return favorite
    }()
    
    
    
    private override init() {
        super.init()
    }
    
    
    
    /* MARK: - Protocol */
    
    internal var mainContext: NSManagedObjectContext {
        return self.container.viewContext
    }
    
    
    internal lazy var container: NSPersistentContainer = {
        let coreDataFileName = "Banco"
        let container = NSPersistentContainer(name: coreDataFileName)
        container.loadPersistentStores() {_, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    

    internal func saveContext() throws -> ErrorCDHandler? {
        if self.mainContext.hasChanges {
            do {
                try self.mainContext.save()
            } catch {
                throw ErrorCDHandler.saveError
            }
        }
        return nil
    }
    
    
    
    /* MARK: - Alimentos */
    
    public func getFoodData(for categorie: String?, _ completionHandler: @escaping (Result<[FoodInfo], ErrorCDHandler>) -> Void) {
        self.mainContext.perform {
            self.foodManeger.getAllData(for: categorie) { result in
                switch result {
                case .success(let data):
                    completionHandler(.success(data))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
        }
    }
    
    
    
    /* MARK: - Hortas */
    
    public func getGardenData(for categorie: String?, _ completionHandler: @escaping (Result<[FoodInfo], ErrorCDHandler>) -> Void) {
        self.mainContext.perform {
            self.foodManeger.getAllData(for: categorie) { result in
                switch result {
                case .success(let data):
                    completionHandler(.success(data))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
        }
    }
    
    
    
    /* MARK: - Favoritos */
    
    public func getFavoriteData(for categorie: String?, _ completionHandler: @escaping (Result<[FoodInfo], ErrorCDHandler>) -> Void) {
        self.mainContext.perform {
            self.foodManeger.getAllData(for: categorie) { result in
                switch result {
                case .success(let data):
                    completionHandler(.success(data))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
        }
    }
    
    
    public func addNewFavoriteData(for data: Any) {
        if let foodData = data as? FoodInfo {
            self.mainContext.perform {
                print(foodData)
            }
        }
        
//        if let gardenData = data as? GardenInfo {
//            self.mainContext.perform {
//                print(gardenData)
//            }
//        }
    }
    
    
    public func removeFromFavorite(data: Any) {
        if let foodData = data as? FoodInfo {
            self.mainContext.perform {
                print(foodData)
            }
        }
        
//        if let gardenData = data as? GardenInfo {
//            self.mainContext.perform {
//                print(gardenData)
//            }
//        }
    }
    
    
    
    public func createData(for key: String) {
        let userDefaults = UserDefaults.standard.bool(forKey: key)
        
        var primaryKey = Int16(UserDefaults.standard.integer(forKey: "primaryKey"))

        if !userDefaults {
            var data: [FoodInfo] = []
            
            let foods = ["Morango", "Batata", "Abacaxi"]
            for item in foods {
                primaryKey += 1
                data.append(FoodInfo(
                    id: primaryKey,
                    name: "\(key.uppercased()) \(item)",
                    categorie: key,
                    isFavorited: false,
                    vitamins: [
                        VitaminaInfo(tipo: "A"),
                        VitaminaInfo(tipo: "B"),
                        VitaminaInfo(tipo: "C")
                    ]
                ))
            }
            
            primaryKey += 1
            data.append(FoodInfo(
                id: primaryKey,
                name: "\(key.uppercased()) FAVORITADO",
                categorie: key,
                isFavorited: false,
                vitamins: [
                    VitaminaInfo(tipo: "A"),
                    VitaminaInfo(tipo: "B"),
                    VitaminaInfo(tipo: "C")
                ]
            ))
            
            primaryKey += 1
            data.append(FoodInfo(
                id: primaryKey,
                name: "\(key.uppercased()) FAVORITADO 02",
                categorie: key,
                isFavorited: false,
                vitamins: [
                    VitaminaInfo(tipo: "A"),
                    VitaminaInfo(tipo: "B"),
                    VitaminaInfo(tipo: "C")
                ]
            ))
            
            self.foodManeger.addNewDatas(with: data)
            
            UserDefaults.standard.set(true, forKey: key)
            UserDefaults.standard.set(Int(primaryKey), forKey: "primaryKey")
            
            let _ = try? self.saveContext()
        }

        self.prettyPrint()
    }


    private func prettyPrint() {
        self.foodManeger.getAllData() { result in
            switch result {
            case .success(let datas):
                print("Pegou os dados -> \(datas.count)")
                for data in datas {
                    print("""
                    \(data.name)
                    \(data.categorie)
                    \(data.isFavorited)
                    \(self.getVitaminasPrint(for: data.vitamins))
                    """)
                }
            case .failure(let error):
                print(error.description)
            }
        }
        
        
        let fetch = Vitamina.fetchRequest()
        
        if let dataFiltered = try? self.mainContext.fetch(fetch) {
            print("\n\nQuantidade de vitaminas: ", dataFiltered.count)
        }
    }


    private func getVitaminasPrint(for vitaminas: [VitaminaInfo]) -> String {
        var str = ""
        for vitamina in vitaminas {
            str.append("Vitamina \(vitamina.tipo)\n")
        }
        return str
    }
}
