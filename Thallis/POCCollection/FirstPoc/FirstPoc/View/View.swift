//
//  View.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 24/08/22.
//

import Foundation
import UIKit

class View: UIView {
    
    /// Título da tela
    public let titleLabel: UILabel = CustomViews.newLabel()

    /// Mostra a informação selecionada
    public let selectedLabel: UILabel = CustomViews.newLabel()
    
    /// Mostra todas as opções disponíveis de célula
    public let nameCollection: UICollectionView = CustomViews.newCollectionView()
    
    /// Constraints dinâmicas
    private var dynamicConstraint: [NSLayoutConstraint] = []
    
    /// Configurar a collectionView - Todas as configurações serão feitas aqui
    private let collectionFlow: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
        cvFlow.scrollDirection = .vertical
        
        cvFlow.itemSize = CGSize(width: 100, height: 100)
        
        return cvFlow
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        self.setupViews()
        self.staticText()
        self.nameCollectionView()
        self.setupUI()
        self.registerCells()
        self.setupCollectionFlows()

    }
    
    /// Faz o registro das células nas Collections
    private func registerCells() {
        self.nameCollection.register(ViewCell.self, forCellWithReuseIdentifier: ViewCell.identifier)
    }

    /// Define o layout que as collections terão
    private func setupCollectionFlows() {
        self.nameCollection.collectionViewLayout = self.collectionFlow
    }
    
    /// Adiciona as views nas células
    private func setupViews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.selectedLabel)
        self.addSubview(self.nameCollection)
    }
    
    // Atribui os textos e suas características
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupConstraints()
    }
    
    private func nameCollectionView() {
    }
    
    /// Define as constraints das células da CollectionView
    private func setupConstraints() {
        let sideSpace: CGFloat = self.bounds.height * 0.02
        let space: CGFloat = 16
        
        // Desativa todas as constraints da tela
        NSLayoutConstraint.deactivate(self.dynamicConstraint)
        
        self.dynamicConstraint = ([
        self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: space),
        self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -space),
        self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
        self.titleLabel.heightAnchor.constraint(equalToConstant: 30),
        
        self.selectedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideSpace * 2),
        self.selectedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -sideSpace * 2),
        self.selectedLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: space),
        self.selectedLabel.heightAnchor.constraint(equalToConstant: 30),
        
        self.nameCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideSpace),
        self.nameCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -sideSpace),
        self.nameCollection.topAnchor.constraint(equalTo: self.selectedLabel.bottomAnchor, constant: space),
        self.nameCollection.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: space)
       ])
        // Ativa todas as constraints da tela
        NSLayoutConstraint.activate(self.dynamicConstraint)
   }
    
        //Função para definir as características da UI
    private func setupUI() {
        self.backgroundColor = .systemBackground
        
        let corners: CGFloat = 8
        
        self.titleLabel.layer.cornerRadius = corners
        self.selectedLabel.layer.cornerRadius = corners
        self.nameCollection.layer.cornerRadius = corners * 2
        
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented)")}

}
