//
//  UILabel+setupText.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 25/08/22.
//

import Foundation
import UIKit

// Essa extension é necessária para evitar a repetição de código e para conseguir lidar com as ocasiões em que não há texto.
// A extension é necessária para consumir a nossa struct de UILabelInfo

extension UILabel {
    
    func setupText(with info: LabelInfo) {
        self.text = info.text
        self.font = .systemFont(ofSize: info.size, weight: info.weight)
    }    
}
