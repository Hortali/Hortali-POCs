//
//  View.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 24/08/22.
//

import Foundation
import UIKit

class View: UIView {
    
    public let titleLabel: UILabel = CustomViews.newLabel()

    public let selectedLabel: UILabel = CustomViews.newLabel()
    
    public let nameCollection: UICollectionView = CustomViews.newCollectionView()
    
    init() {
        super.init(frame: .zero)

        self.setupViews()
        
    }
    
    
    private func setupViews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.selectedLabel)
        self.addSubview(self.nameCollection)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented)")}
    
}
