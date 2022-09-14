/* Gui Reis    -    gui.sreis25@gmail.com */

/* Bibliotecas */
import UIKit

/// UI/UX da tela principal
class View_Personalizada: UIView {
    
    /* MARK: - Atributos */
    
    // Views
    
    /// Título da tela
    private let titleLabel: UILabel = CustomViews.newLabel()
    
    /// Mostra a informação selecionada
    private let selectedLabel: UILabel = CustomViews.newLabel()
    
    /// Mostra todas as opções disponíveis
    public let nameCollection: UICollectionView = CustomViews.newCollectionView()
    
    
    
    private let collectionFlow: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
        cvFlow.scrollDirection = .vertical
        
        cvFlow.itemSize = CGSize(width: 100, height: 100)
        return cvFlow
    }()
    
    
    private var dynamicConstraint: [NSLayoutConstraint] = []
    
    
    /* MARK: - Construtor */
    
    init() {
        super.init(frame: .zero)
        
        self.setupViews()
        self.setupConstraints()
        self.setupStaticTexts()
        self.setupUI()
        
        self.regiterCells()
        self.setupCollectionsFlows()
        
        self.nameCollection.backgroundColor = .brown
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    
    /* MARK: - Encapsulamento */
    
    /// Define qual vai ser a informação que vai ser mostrada
    public func setSelectedLabelText(text: String) {
        self.selectedLabel.setupText(with: LabelInfo(
            text: text, size: 15, weight: .medium
        ))
    }
    
    
    /// Vai atualizar a colllection quando tiver novos dados
    public func reloadCollection() {
        self.nameCollection.reloadData()
        self.nameCollection.reloadInputViews()
    }
    
    
    /* MARK: - Ciclo de Vida */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setupConstraints()
    }
    
    
    
    /* MARK: - Configurações */
    
    /// Defini os leyouts que as collections vão ter
    private func setupCollectionsFlows() {
        self.nameCollection.collectionViewLayout = self.collectionFlow
    }
    
    
    /// Faz o registro das células nas collections
    private func regiterCells() {
        self.nameCollection.register(ViewCell.self, forCellWithReuseIdentifier: ViewCell.identifier)
    }
    
    
    /// Adiciona as views na tela
    private func setupViews() {
        self.addSubview(self.selectedLabel)
        self.addSubview(self.nameCollection)
        self.addSubview(self.titleLabel)
    }
    
    
    /// Define os textos estáticos da tela
    private func setupStaticTexts() {
        self.titleLabel.setupText(with: LabelInfo(
            text: "Nomes Legais", size: 25, weight: .semibold
        ))
    }
    
    
    /// Configura os detalhes das views
    private func setupUI() {
        self.backgroundColor = .brown
        
        // Bordas das views
        let corner: CGFloat = 10
        
        self.titleLabel.layer.cornerRadius = corner
        self.selectedLabel.layer.cornerRadius = corner
        //self.nameCollection.layer.cornerRadius = corner*2
    }
    
    
    /// Define as contraints das views
    private func setupConstraints() {
        let lateral: CGFloat = self.bounds.width * 0.055 // 25
        let between: CGFloat = 15
        
        NSLayoutConstraint.deactivate(self.dynamicConstraint)
        
        self.dynamicConstraint = [
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lateral),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -lateral),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            
            self.selectedLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: between),
            self.selectedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lateral*3),
            self.selectedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -lateral*3),
            self.selectedLabel.heightAnchor.constraint(equalToConstant: 40),
            
            
            self.nameCollection.topAnchor.constraint(equalTo: self.selectedLabel.bottomAnchor, constant: between),
            self.nameCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lateral),
            self.nameCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -lateral),
            self.nameCollection.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraint)
        
        print("Quantidade de constraints \(self.constraints.count)")
    }
}
