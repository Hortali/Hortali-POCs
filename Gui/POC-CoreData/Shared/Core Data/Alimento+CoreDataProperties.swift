////
////  Alimento+CoreDataProperties.swift
////  POC-CoreData
////
////  Created by Gui Reis on 29/09/22.
////
////
//
//import Foundation
//import CoreData
//
//
//extension Alimento {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alimento> {
//        return NSFetchRequest<Alimento>(entityName: "Alimento")
//    }
//
//    @NSManaged public var id: UUID?
//    @NSManaged public var nome: String?
//    @NSManaged public var vitaminas: NSSet?
//
//    public var vitaminasArray: [Vitamina] {
//        let set = vitamina as? Set<Vitamina> ?? []
//        return set.sorted {
//            $0.id < $1.id
//        }
//    }
//
//}
//
//// MARK: Generated accessors for vitaminas
//extension Alimento {
//
//    @objc(addVitaminasObject:)
//    @NSManaged public func addToVitaminas(_ value: Vitamina)
//
//    @objc(removeVitaminasObject:)
//    @NSManaged public func removeFromVitaminas(_ value: Vitamina)
//
//    @objc(addVitaminas:)
//    @NSManaged public func addToVitaminas(_ values: NSSet)
//
//    @objc(removeVitaminas:)
//    @NSManaged public func removeFromVitaminas(_ values: NSSet)
//
//}
//
//extension Alimento : Identifiable {
//
//}
