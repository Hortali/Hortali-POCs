//
//  Vitamina+CoreDataProperties.swift
//  POC-CoreData
//
//  Created by Gui Reis on 29/09/22.
//
//

import Foundation
import CoreData


extension Vitamina {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vitamina> {
        return NSFetchRequest<Vitamina>(entityName: "Vitamina")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var tipo: String?
    @NSManaged public var alimento: Alimento?

}

extension Vitamina : Identifiable {

}
