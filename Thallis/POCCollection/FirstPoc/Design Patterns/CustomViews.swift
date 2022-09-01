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
        label.backgroundColor = .systemBlue
        label.textColor = .white
        label.textAlignment = .center
        label.layer.masksToBounds = true
        
        return label
    }
    /// Cria uma nova Collection View de acordo com o padrão da aplicação.
    static func newCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let cvLayout = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cvLayout.translatesAutoresizingMaskIntoConstraints = false
        cvLayout.backgroundColor = .secondarySystemBackground
        
        return cvLayout
    }
}
