//
//  Vitamina+CoreDataClass.swift
//  POC-CoreData
//
//  Created by Gui Reis on 29/09/22.
//
//

import CoreData

@objc(Vitamina)
public class Vitamina: NSManagedObject, Identifiable {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vitamina> {
        return NSFetchRequest<Vitamina>(entityName: "Vitamina")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var tipo: String?
    @NSManaged public var alimento: Alimento?
}
