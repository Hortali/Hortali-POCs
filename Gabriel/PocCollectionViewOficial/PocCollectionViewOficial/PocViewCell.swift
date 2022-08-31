//
//  PocViewCell.swift
//  Poc_CollectionView
//
//  Created by Gabriel Batista on 24/08/22.
//

import Foundation
import UIKit

class POCViewCell: UICollectionViewCell {
    static let identifier = "collectionCell"
    private let nameLabel: UILabel = {
        let lbl = CustomViews.newLabel()
        lbl.adjustsFontSizeToFitWidth = true
        
        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setText(text: String) {
        self.nameLabel.setupText(info: LabelInfo(text: text,
                                    size: 14,
                                    weight: .semibold))
        self.nameLabel.textColor = .white
    }
    
    
    private func setupViews() {
        contentView.addSubview(nameLabel)
    }
    
    private func setupUI() {
        self.backgroundColor = .green
        self.layer.cornerRadius = 15
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
        ])
    }
    
    
}
