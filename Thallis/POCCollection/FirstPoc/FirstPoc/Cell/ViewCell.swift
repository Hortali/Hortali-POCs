//
//  ViewCell.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 24/08/22.
//

import Foundation
import UIKit

class ViewCell: UICollectionViewCell {
    
    static let identifier = "idViewCell"
    private let nameLabel: UILabel = {
        let lbl = CustomViews.newLabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 2
         
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setText(with: "Sem nome")
        self.setupView()
        self.setupUI()
        self.setupConstraints()
        
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    public func setText(with text: String) {
        self.nameLabel.setupText(with: LabelInfo(text: text,
                                                 size: 15,
                                                 weight: .regular))
    }
    
    private func setupView() {
        self.contentView.addSubview(self.nameLabel)
        
    }
    
    private func setupUI() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
    }
    
    private func setupConstraints () {
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
    }
    
    
}


