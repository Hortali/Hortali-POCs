//
//  ViewControllerProtocol.swift
//  PocCollectionViewOficial
//
//  Created by Gabriel Batista on 31/08/22.
//

import Foundation
protocol ViewControllerProtocol: NSObject {
    func getData() -> [String]
    
    func updateCellSelected(at row: Int)
}
