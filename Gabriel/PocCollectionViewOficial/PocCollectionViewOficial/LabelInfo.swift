//
//  LabelInfo.swift
//  Poc_CollectionView
//
//  Created by Gabriel Batista on 25/08/22.
//

import Foundation
import UIKit

struct LabelInfo {
    let text: String
    let size: CGFloat
    let weight: UIFont.Weight
    
    init (text:String, size:CGFloat, weight:UIFont.Weight = .medium){
        self.text = text
        self.size = size
        self.weight = weight
    }
}
