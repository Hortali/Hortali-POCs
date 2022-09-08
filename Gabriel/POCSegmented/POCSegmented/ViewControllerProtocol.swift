//
//  ViewControllerProtocol.swift
//  POCSegmented
//
//  Created by Gabriel Batista on 06/09/22.
//

import Foundation
protocol ViewControllerProtocol: NSObject {
    func getData() -> [String]
    
    func updateCellSelected(at row: Int)
}
