/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import CoreData


enum CDManager {
    
    /* MARK: - Atributos */
    
    /// Usada para fazer alterações na tabela
    static var mainContext: NSManagedObjectContext {
        return self.container.viewContext
    }
    
    
    /// Tabela que a classe está mexendo (pegando a tebela e tornando em uma variável)
    static var container: NSPersistentContainer = {
        let coreDataFileName = "Banco"
        let container = NSPersistentContainer(name: coreDataFileName)
        container.loadPersistentStores() {_, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()


    
    /* MARK: - Configurações do Core Data */
    
    /// Salvando e atualizando alterações que tiveram no core data
    static func saveContext() {
        if self.mainContext.hasChanges {
            do {
                try self.mainContext.save()
            } catch (let errorGenerated) {
                fatalError("Unresolved error \(errorGenerated)")
            }
        }
    }
}



class AlimentoCDManager {
    
    /* MARK: - Atributos */
    
    /// Variável singleton para lidar com as informações do Core Data
    static let shared: AlimentoCDManager = AlimentoCDManager()
    
    
    private lazy var allData: [Alimento] = {
        let fr = Alimento.fetchRequest()
        if let allData = try? CDManager.mainContext.fetch(fr) {
            return allData
        }
        return []
    }()
    
    
    private init() {
        
    }
    
    
    
    /* MARK: - Acessando o Core Data (Encapsulamento) */
    
    /// Pega um único dado a partir do id
    public func getDocument(at documentID: UUID) -> Alimento? {
        return self.allData.first { element in
            element.id == documentID
        }
    }
    
    
    private func getVitaminasFrom(relashion: [Vitamina]) -> [VitaminaInfo] {
        var models: [VitaminaInfo] = []
        
        for data in relashion {
            if let tipo = data.tipo {
                models.append(VitaminaInfo(tipo: tipo))
            }
        }
        
        return models
    }
    
    /// Pega todos os dados salvos
    public func getAllData() -> [AlimentoInfo] {
        var models: [AlimentoInfo] = []
        
        for data in self.allData {
            if let nome = data.nome {
                models.append(AlimentoInfo(
                    nome: nome,
                    vitaminas: self.getVitaminasFrom(relashion: data.vitaminasArray)
                ))
            }
        }
        
        return models
    }
    
    
    /// Adiciona um novo dado
    public func addNewData(with data: AlimentoInfo) {
        let newData = Alimento(context: CDManager.mainContext)
        
        newData.nome = data.nome
        
        // Lidando com o relacionamento
        for vitamina in data.vitaminas {
            let item = Vitamina(context: CDManager.mainContext)
            item.tipo = vitamina.tipo
            
            newData.addToVitaminas(item)
        }
        
        CDManager.saveContext()
    }
    
    
    
    /// Remove um dado no Core Data
    public func deleteData(at item: Alimento) throws {
        CDManager.mainContext.delete(item)
        CDManager.saveContext()
    }
}
