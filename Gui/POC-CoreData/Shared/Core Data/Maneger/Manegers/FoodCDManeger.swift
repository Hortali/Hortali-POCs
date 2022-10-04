/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import CoreData


internal class FoodCDManager {
    
    /* MARK: - Atributos */
    
    /// Cache dos alimentos
    private var foodCategories: [String: [FoodInfo]] = [:]
    
    
    /* Relacionamentos */
    
    /// Relacionamento com as vitaminas
    private lazy var vitaminManager = VitaminCDManeger()
    
    
    /* Protocolo */
    
    /// Protocolo do core data
    public weak var coreDataProperties: CoreDataProperties? {
        didSet {
            self.vitaminManager.coreDataProperties = self.coreDataProperties
        }
    }
    
    
    
    /* MARK: - Métodos (Públicos) */
    
    /// Pega um único dado (alimento) a partir do id
    /// - Parameter id: id do alimento
    /// - Parameter completionHandler: em caso de sucesso retorna o alimento
    public func getDataById(for id: Int, _ completionHandler: @escaping (_ data: FoodInfo?, _ error: ErrorCDHandler?) -> Void) {
        if let coreDataProperties {
            let fetch = Food.fetchRequest()
            fetch.predicate = NSPredicate(format: "%K == '\(id)'", #keyPath(Food.name))
            fetch.fetchLimit = 1
            
            if let dataFiltered = try? coreDataProperties.mainContext.fetch(fetch) {
                
                if dataFiltered.isEmpty {
                    return completionHandler(nil, .dataNotFound)
                }
                let data = self.transformToModel(entity: dataFiltered[0])
                return completionHandler(data, nil)
            }
            return completionHandler(nil, .fetchError)
        }
        return completionHandler(nil, .protocolNotSetted)
    }
    
    
    /// Pega todos os dados de alimentos
    /// - Parameters:
    ///   - categorie: cateogoria do alimento
    ///   - completionHandler: acessa o core data e retorna os dados caso tenha sucesso
    public func getAllData(for categorie: String? = nil, _ completionHandler: @escaping (Result<[FoodInfo], ErrorCDHandler>) -> Void) {
        var predicate: NSPredicate? = nil
        
        if let categorie {
            if let data = self.foodCategories[categorie] {
                return completionHandler(.success(data))
            }
            predicate = NSPredicate(format: "%K == '\(categorie)'", #keyPath(Food.categorie))
        }
        
        if let coreDataProperties {
            let fetch = Food.fetchRequest()
            fetch.predicate = predicate
            
            if let dataFiltered = try? coreDataProperties.mainContext.fetch(fetch) {
                print("\n\n", dataFiltered)
                let data = dataFiltered.map { element in
                    self.transformToModel(entity: element)
                }
                
                self.foodCategories[categorie ?? "all"] = data
                return completionHandler(.success(data))
            }
            return completionHandler(.failure(.fetchError))
        }
        return completionHandler(.failure(.protocolNotSetted))
    }
    
    
    /// Remove todos os dados do Core Data
    public func deleteAllData(_ completionHandler: @escaping (Result<Bool, ErrorCDHandler>) -> Void) {
        if let coreDataProperties {
            let ft: NSFetchRequest<NSFetchRequestResult> = Food.fetchRequest()
            ft.predicate = NSPredicate(format: "%K == false", #keyPath(Food.isFavorited))
            ft.includesPropertyValues = false
            
            let delRequest = NSBatchDeleteRequest(fetchRequest: ft)
            delRequest.resultType = .resultTypeStatusOnly
            
            let coordinator = coreDataProperties.container.persistentStoreCoordinator
            if let result = try? coordinator.execute(delRequest, with: coreDataProperties.mainContext) as? NSBatchDeleteResult {
                
                let isDeleted = result.result as? Bool ?? false
                return completionHandler(.success(isDeleted))
            }
            return completionHandler(.failure(.deleteError))
        }
        return completionHandler(.failure(.protocolNotSetted))
    }
    
    
    /// Adiciona novos dados a partir de uma lista de dados
    /// - Parameter datas: dados que vão ser adicionados
    public func addNewDatas(with datas: [FoodInfo]) {
        for data in datas {
            self.addNewData(with: data)
            let _ = try? self.coreDataProperties?.saveContext()
        }
        print("\n\n")
        
//        datas.forEach {element in
//            self.addNewData(with: element)
//        }
    }
    
    
    
    /* MARK: - Configurações */
    
    /// Adiciona um novo dado a partir do modelo
    /// - Parameter data: dado que vai ser adicionado
    private func addNewData(with data: FoodInfo) {
        self.createNewData(with: data)
//        self.getDataById(for: Int(data.id)) { _, error in
//            if error == .dataNotFound {
//
//            }
//        }
    }
    
    
    /// Cria uma nova linha no core dada
    /// - Parameter data: dado que vai ser criado
    private func createNewData(with data: FoodInfo) {
        if let coreDataProperties {
            let newData = Food(context: coreDataProperties.mainContext)
            newData.id = data.id
            newData.name = data.name
            newData.categorie = data.categorie
            newData.isFavorited = data.isFavorited
            
            // Lidando com o relacionamento
            for data in data.vitamins {
                if let vitamin = self.vitaminManager.createIfNeeded(for: data) {
                    print("Vou adicionar")
                    newData.addToVitaminas(vitamin)
                }
            }
            
            print("Vitaminas add: ", newData.vitaminsRelated.count)
            let _ = try? self.coreDataProperties?.saveContext()
        }
    }
    
    
    /// Transforma a entidade do core date para o modelo (struct)
    /// - Parameter entity: a entidade
    /// - Returns: modelo
    private func transformToModel(entity: Food) -> FoodInfo {
        return FoodInfo(
            id: entity.id,
            name: entity.name,
            categorie: entity.categorie,
            isFavorited: entity.isFavorited,
            vitamins: self.vitaminManager.getVitaminas(from: entity.vitaminsRelated)
        )
    }
}
