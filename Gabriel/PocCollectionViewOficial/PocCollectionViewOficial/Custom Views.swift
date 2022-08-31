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
        cv.backgroundColor = .black
        
        return cv
    }
}
