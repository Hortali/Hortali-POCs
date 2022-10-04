/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import class Foundation.NSObject

import class CoreData.NSManagedObjectContext
import class CoreData.NSPersistentContainer


/// Qual objetivo desse protocolo?
protocol CoreDataProperties: NSObject {
    
    /// Usada para fazer alterações na tabela
    var mainContext: NSManagedObjectContext { get }
    
    
    /// Tabela que a classe está mexendo (pegando a tebela e tornando em uma variável)
    var container: NSPersistentContainer { get }
    

    
    /* MARK: - Configurações do Core Data */
    
    /// Salvando e atualizando alterações que tiveram no core data
    func saveContext() throws -> ErrorCDHandler?
}
