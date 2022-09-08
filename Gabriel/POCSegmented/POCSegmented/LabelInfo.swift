//
//  LabelInfo.swift
//  Poc_CollectionView
//
//  Created by Gabriel Batista on 25/08/22.
//

import Foundation
import UIKit

// Esta estrutura armazena as informações necessárias para configuração de uma Label. Geralmente é usada junto a chamada da função setupText que definimos como extensão de UILabel.

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
