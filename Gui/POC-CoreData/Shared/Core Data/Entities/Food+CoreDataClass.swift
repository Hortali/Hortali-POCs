
import CoreData

@objc(Food)
public class Food: NSManagedObject, Identifiable {
    
    /* MARK: - Atributos */
    
    /* Colunas da entidade */
    @NSManaged public var id: Int16
    @NSManaged public var name: String
    @NSManaged public var categorie: String
    @NSManaged public var isFavorited: Bool
    @NSManaged public var vitaminas: NSSet
    
    
    /// Vitaminas ligadas ao alimento
    public var vitaminsRelated: [Vitamina] {
        let set = self.vitaminas as? Set<Vitamina> ?? []
        return set.sorted {
            $0.id < $1.id
        }
    }
    
    
    
    /* MARK: - Métodos (Core Data) */
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }
    
    
    
    /* MARK: - Métodos (Relacionamento)*/
    
    @objc(addVitaminasObject:)
    @NSManaged public func addToVitaminas(_ value: Vitamina)

    @objc(removeVitaminasObject:)
    @NSManaged public func removeFromVitaminas(_ value: Vitamina)

    @objc(addVitaminas:)
    @NSManaged public func addToVitaminas(_ values: NSSet)

    @objc(removeVitaminas:)
    @NSManaged public func removeFromVitaminas(_ values: NSSet)
}
