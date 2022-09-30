/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import CoreData


class VitaminaCDManeger {
    
    /* MARK: - Atributos */
    
    /// Variável singleton para lidar com as informaçòes do Core Data
    static let shared: VitaminaCDManeger = VitaminaCDManeger()
    
    
    /// Nome da entidade "tabela" que a classe está lidando
    private let entityName: String = "Vitamina"
        
    
    /// Usada para fazer alterações na tabela
    private var mainContext: NSManagedObjectContext {
        return self.container.viewContext
    }
    
    
    /// Tabela que a classe está mexendo (pegando a tebela e tornando em uma variável)
    private lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataInfo.coreDataName)
        container.loadPersistentStores() {_, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()


    
    /* MARK: - Configurações do Core Data */
    
    /// Salvando e atualizando alterações que tiveram no core data
    private func saveContext() -> Void {
        if self.mainContext.hasChanges {
            do {
                try self.mainContext.save()
            } catch (let errorGenerated) {
                print("Erro na hora de salvar \(errorGenerated)")
                fatalError("Unresolved error \(errorGenerated)")
            }
        }
    }
    
    
    
    /* MARK: - Acessando o Core Data (Encapsulamento) */
    
    /// Pega um único dado a partir do id
    public func getDocument(at documentID: UUID) -> Vitamina? {
        let fr = NSFetchRequest<Vitamina>(entityName: self.entityName)
        do {
            let allDocuments = try self.mainContext.fetch(fr)
            
            for document in allDocuments {
                if document.id == documentID {
                    return document
                }
            }
            return nil
        } catch {
            print(error)
        }
        return nil
    }
    
    
    /// Pega todos os dados salvos
    public func getAllData() -> [Vitamina] {
        let fr = NSFetchRequest<Vitamina>(entityName: self.entityName)
        do {
            return try self.mainContext.fetch(fr)
        } catch {
            print(error)
        }
        return []
    }
    
    
    /// Adiciona um novo dado
    public func addNewData(with data: VitaminaInfo) throws -> Vitamina {
        let newData = Vitamina(context: self.mainContext)
        
        newData.tipo = data.tipo
        
        self.saveContext()
        return newData
    }
    
    
    /// Remove um dado no Core Data
    public func deleteData(at item: Vitamina) throws {
        self.mainContext.delete(item)
        self.saveContext()
    }
}
