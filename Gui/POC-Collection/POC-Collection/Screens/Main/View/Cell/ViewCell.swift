//
//  ViewCell.swift
//  POC-Collection
//
//  Created by Gui Reis on 24/08/22.
//

import Foundation
import UIKit


class ViewCell: UICollectionViewCell {
    
    static let identifier: String = "IdViewCell"
    
    private let nameLabel: UILabel = {
        let lbl = CustomViews.newLabel()
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupViews()
        self.setupUI()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    
    // Encapsulamento
    
    public func setTextLabel(with text: String) {
        self.nameLabel.text = text
    }
    
    
    override func layoutSubviews() {
        self.setupStaticTexts()
    }
    
    // Configurações
    
    private func setupStaticTexts() {
        self.nameLabel.setupText(with: LabelInfo(
            size: self.contentView.bounds.height * 0.35, weight: .semibold)
        )
    }
    
    
    private func setupViews() {
        self.contentView.addSubview(self.nameLabel)
    }
    
    
    private func setupUI() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.contentView.bounds.height*0.05
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
    }
}
