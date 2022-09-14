/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit

class MenuView: UIView {
    
    /* MARK: - Atributos */
    
    // Views
    
    /// Título da tela
    private let titleLabel: UILabel = {
        let lbl: UILabel = CustomViews.newLabel()
        lbl.textAlignment = .left
        return lbl
    }()
    
    /// Botão de favoritar o card
    private let favoriteButton: UIButton = CustomViews.newButton()

    
    // Outros
    
    /// Constraints que vão mudar de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
        
        
        /// Configurações do layout da collection
        private let collectionFlow: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
        cvFlow.scrollDirection = .vertical
             
        return cvFlow
    }()



    /* MARK: - Construtor */
    
    init() {
        super.init(frame: .zero)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    
    /* MARK: - Encapsulamento */

    /// Atualiza o ícone de favoritado de acordo com o estado dele
    public func updateFavoriteState(to isFavorited: Bool) {
        switch isFavorited {
        case true:
            self.favoriteButton.setTitle("SIM Favoritado", for: .normal)
            
        case false:
            self.favoriteButton.setTitle("NÃO Favoritado", for: .normal)
        }
    }
    
    
    /// Atualiza o texto do título da view
    public func updateTitleText(with text: String) {
        self.titleLabel.text = text
    }
    

    
    /* MARK: - Ciclo de Vida */
    
    override func layoutSubviews() {
        super.layoutSubviews()
          
        self.setupUI()
        self.setupStaticTexts()
        self.setupDynamicConstraints()
    }
    
    
    
    /* MARK: - Configurações */


    /* Geral */
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.favoriteButton)
    }
    
    
    /// Personalização da UI
    private func setupUI() {
        self.titleLabel.layer.cornerRadius = self.bounds.width * 0.06
        
        self.favoriteButton.layer.cornerRadius = self.bounds.width * 0.04
    }
    
    
    /// Define os textos que são estáticos (os textos em si que vão sempre ser o mesmo)
    private func setupStaticTexts() {
        /* Labels */
        self.titleLabel.setupText(with: FontInfo(
            fontSize: self.bounds.width * 0.05, weight: .semibold)
        )
        
        
        /* Botões */
        self.favoriteButton.setupText(with: FontInfo(
            text: "Meu Botão", fontSize: self.bounds.width * 0.03, weight: .regular)
        )
    }
      
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() {
        let lateral: CGFloat = self.bounds.width * 0.1
        let between: CGFloat = self.bounds.width * 0.05
        
        let btSize: CGFloat = self.bounds.width * 0.2
       
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
    
        self.dynamicConstraints = [
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lateral),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: lateral),
            
            
            self.favoriteButton.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: between),
            self.favoriteButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            self.favoriteButton.heightAnchor.constraint(equalToConstant: btSize),
            self.favoriteButton.widthAnchor.constraint(equalToConstant: btSize),
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
    
    /**
     Responsável por criar o inicío de uma conversa com alguem
     - Parameter nome: Nome da pessoa que esta conversando
     - Returns: Uma introdução de conversa com o nome da pessoa
        
    Essa função é bem simples, tem comop obetivo ser apenas como base caso não tenha nenhuma
    criatividade para inciar uma conversa
     */
    public func minhaFuncao(nome: String) -> String {
        return "Ola, \(nome)"
    }
}





