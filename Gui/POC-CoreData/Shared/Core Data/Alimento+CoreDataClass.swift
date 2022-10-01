//
//  Alimento+CoreDataClass.swift
//  POC-CoreData
//
//  Created by Gui Reis on 29/09/22.
//
//
import CoreData

@objc(Alimento)
public class Alimento: NSManagedObject, Identifiable {
    
    /* MARK: - Atributos */
    
    /* Colunas da entidade */
    @NSManaged public var id: UUID?
    @NSManaged public var nome: String?
    @NSManaged public var vitaminas: NSSet?
    
    
    /// Vitamainas ligadas ao alimento
    public var vitaminasArray: [Vitamina] {
        let set = self.vitaminas as? Set<Vitamina> ?? []
        return set.sorted {
            $0.id < $1.id
        }
    }
    
    
    
    /* MARK: - Métodos (Core Data) */
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alimento> {
        return NSFetchRequest<Alimento>(entityName: "Alimento")
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
