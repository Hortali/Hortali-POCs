/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// O que essa classe faz?
class NameCell: UICollectionViewCell {
    
    /* MARK: - Atributos */

    /// Identificador da célula
    static let identifier = "IdNameCell"
    

    // Views
    
    private let nameLabel = CustomViews.newLabel()
    

    // Outros

    /// Constraints que vão mudar de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
    
    
    
    /* MARK: - Construtor */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    
    /* MARK: - Encapsulamento */
    
    public func setName(for name: String) {
        self.nameLabel.text = name
    }
    
    

    /* MARK: - Ciclo de Vida */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setupStaticTexts()
        self.setupDynamicConstraints()
        self.setupUI()
    }
    
    
    
    /* MARK: - Configurações */
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {    
        self.contentView.addSubview(self.nameLabel)
    }
    
    
    /// Personalização da UI
    private func setupUI() {
        self.layer.cornerRadius = 20
    }
    
    
    /// Define os textos que são estáticos (os textos em si que vão sempre ser o mesmo)
    private func setupStaticTexts() {		
        self.nameLabel.setupText(with: FontInfo(
            fontSize: 15, weight: .medium
        ))
    }
	  
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() { 
//        let lateral: CGFloat =
//        let between: CGFloat =
       
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
    
        self.dynamicConstraints = [
            self.nameLabel.topAnchor
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
