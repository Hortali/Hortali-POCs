//
//  UILabel+setupText.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 25/08/22.
//

import Foundation
import UIKit

extension UILabel {
    
    func setupText(with info: LabelInfo) {
        self.text = info.text
        self.font = .systemFont(ofSize: info.size, weight: info.weight)
    }    
}
