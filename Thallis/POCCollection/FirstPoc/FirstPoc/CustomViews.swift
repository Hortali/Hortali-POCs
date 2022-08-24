//
//  CustomViews.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 24/08/22.
//

import Foundation
import UIKit

struct CustomViews {
    
    /// Cria uma nova label de acordo com o padrão da aplicação.
    static func newLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray
        label.textColor = .systemBlue
        
        return label
    }
    
    /// Cria uma nova Collection View de acordo com o padrão da aplicação.
    static func newCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .secondarySystemBackground
        
        return cv
    }
}
