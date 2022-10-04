/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import class CoreData.NSPredicate


internal class VitaminCDManeger {
    
    /* MARK: - Atributos */
    
    public weak var coreDataProperties: CoreDataProperties?
    
    
    
    /* MARK: - Métodos */
    
    /// Tranforma os dados da entidade para o modelo
    /// - Parameter entities: conjunto de entidade
    /// - Returns: conjunto dos modelos
    public func getVitaminas(from entities: [Vitamina]) -> [VitaminaInfo] {
        print("\n\nEntidades recebidas: \(entities.count)\n\n")
        return entities.map {element in
            VitaminaInfo(tipo: element.tipo)
        }
    }
    
    
    /// Verifica se tem uma entidade no core data a partir do nome dela
    /// - Parameter name: nome da vitamina
    /// - Returns: se caso exista retorna ela
    public func getVitaminByName(with name: String) -> Vitamina? {
        if let coreDataProperties {
            let fetch = Vitamina.fetchRequest()
            fetch.predicate = NSPredicate(format: "%K == '\(name)'", #keyPath(Vitamina.tipo))
            fetch.fetchLimit = 1
            
            return try? coreDataProperties.mainContext.fetch(fetch).first
        }
        return nil
    }
    
    
    /// Verifica se tem uma entidade no core data a partir do nome dela
    /// - Parameter name: nome da vitamina
    /// - Returns: se caso exista retorna ela
    public func createIfNeeded(for data: VitaminaInfo) -> Vitamina? {
        if let vitamin = self.getVitaminByName(with: data.tipo) {
            
            print("Vitamina já adicionada: \(vitamin.tipo)")
            return vitamin
        }
        
        if let coreDataProperties {
            let vitamin = Vitamina(context: coreDataProperties.mainContext)
            vitamin.tipo = data.tipo
            
            print("Vitamina criada: \(vitamin.tipo)")
            return vitamin
        }
        return nil
    }
}
