//
//  ViewControllerDelegate.swift
//  POC-Collection
//
//  Created by Gui Reis on 30/08/22.
//

import UIKit

protocol ViewControllerDelegate: NSObject {
    func getDados() -> [String]
    
    func updateCellSelected(at row: Int)
}
