//
//  CustomViews.swift
//  POC-Collection
//
//  Created by Gui Reis on 24/08/22.
//

import UIKit


struct CustomViews {
    
    /// Cria uma nova label de acordo com a padronização da aplicação
    static func newLabel() -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .blue
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.layer.masksToBounds = true
        
        return lbl
    }
    
    
    static func newCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .yellow
        
        return cv
    }
    
    
    
    static func newButton() -> UIButton {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        return bt
    }
 }
