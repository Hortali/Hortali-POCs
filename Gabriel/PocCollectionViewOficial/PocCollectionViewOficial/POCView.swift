//
//  POCView.swift
//  Poc_CollectionView
//
//  Created by Gabriel Batista on 24/08/22.
//

import Foundation
import UIKit

class POCView: UIView {
    public let titleLabel: UILabel = CustomViews.newLabel()
    public let selectedLabel: UILabel = CustomViews.newLabel()
    public let nameCollection: UICollectionView = CustomViews.newCollectionView()
    
    private var dynamicConstraint: [NSLayoutConstraint] = []

    // Esta classe realiza as configurações da colletction. Define o sentido do scroll e o tamanho da célula.
    private let collectionFlow: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
        cvFlow.scrollDirection = .vertical
        
        cvFlow.itemSize = CGSize(width: 100, height: 100)
        return cvFlow
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.setupViews()
        self.setupUI()
        self.setConstraints()
        self.setupStaticTexts()
        self.registerCell()
        self.setupCollectionFlow()
    }
    
    public func setupSelectedLabel(withText: String) {
        self.selectedLabel.setupText(info: LabelInfo(text: withText, size: 17))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setConstraints()
    }
    
    private func setupViews() {
        self.addSubview(self.nameCollection)
        self.addSubview(self.titleLabel)
        self.addSubview(self.selectedLabel)
    }
    
    private func setupStaticTexts() {
        self.titleLabel.setupText(info: LabelInfo(text: "Nomes Legais", size: 24, weight: .semibold))
    }
    
    private func registerCell() {
        nameCollection.register(POCViewCell.self, forCellWithReuseIdentifier: POCViewCell.identifier)

    }
    
    private func setupCollectionFlow() {
        self.nameCollection.collectionViewLayout = self.collectionFlow
    }
    
    private func setupUI() {
        self.backgroundColor = .gray
        self.titleLabel.layer.cornerRadius = 10
        self.selectedLabel.layer.cornerRadius = 10
//        self.nameCollection.layer.cornerRadius = 30
        
        
    }
    
    private func setConstraints(){
        let lateral: CGFloat = self.bounds.width * 0.05
        let between: CGFloat = 15
        
        NSLayoutConstraint.deactivate(self.dynamicConstraint)
        
        self.dynamicConstraint = [

            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 60),


            self.selectedLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: between),
            self.selectedLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.selectedLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.selectedLabel.heightAnchor.constraint(equalToConstant: 40),


            self.nameCollection.topAnchor.constraint(equalTo: self.selectedLabel.bottomAnchor, constant: between),
            self.nameCollection.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.nameCollection.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.nameCollection.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraint)
        
        
    }
    
    required init?(coder:NSCoder) {fatalError("init(coder: ) has not been implemented")}
    
}
