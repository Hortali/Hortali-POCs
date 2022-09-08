/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit

open class SegmentedView: UIView {
    
    /* MARK: - Atributos */
    
    // Views
    public let testCollection: UICollectionView = CustomViews.newCollectionView()
    public let mySegmented: UISegmentedControl = CustomViews.newSegmentation()
    public let selectedLabel: UILabel = CustomViews.newLabel()
    
    // Outros
    
    /// Constraints que vão mudar de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
    
    
    /// Configurações do layout da collection
    private let collectionFlow: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
        cvFlow.scrollDirection = .vertical
        cvFlow.itemSize = CGSize(width: 150, height: 150)
        return cvFlow
    }()
    
    
    
    /* MARK: - Construtor */
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        self.setupViews()
        self.setupCollectionFlow()
    }
    
    public required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    
    /* MARK: - Encapsulamento */
    
    /* Ações dos Botões */
    
    /// Define a ação do botão
    public func setAction(target: Any?, action: Selector) -> Void {
        self.mySegmented.addTarget(target, action: action, for: .valueChanged)
    }
    
    public func reloadCollection() {
        self.testCollection.reloadData()
        self.testCollection.reloadInputViews()
    }
    
    public func setupSelectedLabel(withText: String) {
        self.selectedLabel.setupText(info: LabelInfo(text: withText, size: 17))
    }
    
    /* MARK: - Ciclo de Vida */
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        self.setupUI()
        self.registerCell()
        self.setupStaticTexts()
        self.setupDynamicConstraints()
    }
    
    
    
    /* MARK: - Configurações */
    
    /* Collection */
    
    /// Registra as células nas collections/table
    private func registerCell() {
        testCollection.register(PocSegmentedCell.self, forCellWithReuseIdentifier: PocSegmentedCell.identifier)
    }
    
    
    /// Define o layout da collection
    private func setupCollectionFlow() {
        self.testCollection.collectionViewLayout = self.collectionFlow
    }
    
    
    /* Geral */
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        self.addSubview(testCollection)
        self.addSubview(mySegmented)
//        self.addSubview(self.selectedLabel)
    }
    
    
    /// Personalização da UI
    private func setupUI() {
        /*
         Aqui vão definidos as bordas, cor de fundo da view
         */
        
        // Define o tamanho que a célula vai ter
        // self.collectionFlow.itemSize = CGSize(width: 100, height: 100)
    }
    
    
    /// Define os textos que são estáticos (os textos em si que vão sempre ser o mesmo)
    private func setupStaticTexts() {
        /*
         Aqui vão ser configurados os textos estáticos, ícones dos botões
         tamanho das fontes, peso das fontes.. (para botões e labels ou até
         mesmo para putrp elemento caso tenha)
         */
        
        /* Labels */
        self.selectedLabel.setupText(info: LabelInfo(
            text: "Ola", size: 20, weight: .semibold
        ))
        
        
        /* Botões */
    }
    

    
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() {
         let lateral: CGFloat = self.bounds.width * 0.05
//         let between: CGFloat = 10
        
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
        
        self.dynamicConstraints = [
            self.mySegmented.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),
            self.mySegmented.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.mySegmented.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.mySegmented.heightAnchor.constraint(equalToConstant: 30),
            
            self.testCollection.topAnchor.constraint(equalTo: self.mySegmented.bottomAnchor, constant: lateral),
            self.testCollection.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.testCollection.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            self.testCollection.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
        ]
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
