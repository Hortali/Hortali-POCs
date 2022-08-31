//
//  ViewControllerProtocol.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 31/08/22.
//

import Foundation

protocol ViewControllerProtocol: NSObject {
    
    //é uma lista de string porque no nosso coreData (na View Controller) é uma lista de strings
    func getDados() -> [String]
    
    func updateSelectedCell(at row: Int)
    
}
