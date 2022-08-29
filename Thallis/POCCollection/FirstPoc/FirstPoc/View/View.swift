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
        self.setupConstraints()
        self.staticText()
        self.nameCollectionView()
        self.setupUI()
        
    }
    
    private func setupViews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.selectedLabel)
        self.addSubview(self.nameCollection)
    }
    
    private func setupConstraints() {
        
        let space: CGFloat = 16
        let sideSpace: CGFloat = 32
        
       NSLayoutConstraint.activate([
        self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: space),
        self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -space),
        self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
        self.titleLabel.heightAnchor.constraint(equalToConstant: 30),
        
        self.selectedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideSpace * 2),
        self.selectedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -sideSpace * 2),
        self.selectedLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: space),
        self.selectedLabel.heightAnchor.constraint(equalToConstant: 30),
        
        self.nameCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: space),
        self.nameCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -space),
        self.nameCollection.topAnchor.constraint(equalTo: self.selectedLabel.bottomAnchor, constant: space),
        self.nameCollection.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: space)
       ])
   }

    private func staticText() {
        self.titleLabel.setupText(with: LabelInfo(text: "Nomes legais",
                                                     size: 24,
                                                     weight: .medium))
        
    }
    
    public func setSelectedLabelText(text: String) {
        self.selectedLabel.setupText(with: LabelInfo(text: text,
                                                     size: 16,
                                                     weight: .regular))
    }
    
    private func nameCollectionView() {
        self.nameCollection.backgroundColor = .systemYellow
    }
    
    private func setupUI() {
        self.backgroundColor = .systemBackground
        
        let corners: CGFloat = 8
        
        self.titleLabel.layer.cornerRadius = corners
        self.selectedLabel.layer.cornerRadius = corners
        self.nameCollection.layer.cornerRadius = corners*2
        
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented)")}

}
