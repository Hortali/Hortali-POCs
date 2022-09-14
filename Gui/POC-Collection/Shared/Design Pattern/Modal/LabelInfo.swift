//
//  LabelInfo.swift
//  POC-Collection
//
//  Created by Gui Reis on 25/08/22.
//

import UIKit

struct LabelInfo {
    let text: String?
    let size: CGFloat
    let weight: UIFont.Weight
    
    
    init (size: CGFloat, weight: UIFont.Weight = .medium) {
        self.text = nil
        self.size = size
        self.weight = weight
    }
    
    
    init (text: String, size: CGFloat, weight: UIFont.Weight = .medium) {
        self.text = text
        self.size = size
        self.weight = weight
    }
    
    
//    init (text: String, size: CGFloat) {
//        self.text = text
//        self.size = size
//        self.weight = .medium
//    }
}
