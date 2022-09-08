//
//  Custom Views.swift
//  Poc_CollectionView
//
//  Created by Gabriel Batista on 24/08/22.
//

import Foundation
import UIKit

// Esta classe tem a função da Design System.
class CustomViews {
    static func newLabel() -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .red
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.layer.masksToBounds = true
        
        return lbl
    }
    
    static func newCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        
        return collection
    }
    
    static func newSegmentation() -> UISegmentedControl {
        let items = ["Todos", "BBB", "Frutas", "TOP"] // isso aqui poderia ir aonde?
        // aparentemente os itens são atribuidos juntos com a atribuição de SegmentedControl à uma variável
        let sgmen = UISegmentedControl(items: items)
        sgmen.translatesAutoresizingMaskIntoConstraints = false
        sgmen.backgroundColor = .green
        
        return sgmen
    }
}
