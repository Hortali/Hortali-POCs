//
//  UILabel+setupText.swift
//  POC-Collection
//
//  Created by Gui Reis on 25/08/22.
//

import UIKit


extension UILabel {
    
    internal func setupText(with info: LabelInfo) {
        if let text = info.text {
            self.text = text
        }
        self.font = .systemFont(ofSize: info.size, weight: info.weight)
    }
}
