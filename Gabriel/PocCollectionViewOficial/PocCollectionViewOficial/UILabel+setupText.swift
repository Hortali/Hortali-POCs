//
//  UILabel+setupText.swift
//  Poc_CollectionView
//
//  Created by Gabriel Batista on 25/08/22.
//

import Foundation
import UIKit

extension UILabel {
    internal func setupText(info: LabelInfo) {
        self.text = info.text
        self.font = .systemFont(ofSize: info.size, weight: info.weight)
    }
}


