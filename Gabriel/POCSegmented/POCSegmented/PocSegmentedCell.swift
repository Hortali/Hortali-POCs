/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit

open class PocSegmentedCell: UICollectionViewCell {
    
    /* MARK: - Atributos */
    
        /// Identificador da célula
    static let identifier = "segmentedCell"
    private let nameLabel: UILabel = {
        let lbl = CustomViews.newLabel()
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    // Views
   
    
    /// Constraints que vão mudar de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
    
      
    /* MARK: - Construtor */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupViews()
    }
    
    public required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    
    /* MARK: - Encapsulamento */

    
    
    /* MARK: - Ciclo de Vida */
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        self.setupStaticTexts()
        self.setupDynamicConstraints()
        self.setupUI()
        
        self.reloadInputViews()
    }
    
    
    
    /* MARK: - Configurações */
    
    public func setText(text: String) {
        self.nameLabel.setupText(info: LabelInfo(text: text, size: 14, weight: .semibold))
        self.nameLabel.textColor = .white
    }
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        contentView.addSubview(nameLabel)
    }
    
    
    /// Personalização da UI
    private func setupUI() {
        self.backgroundColor = .red
        self.layer.cornerRadius = 15
    }
    
    
    /// Define os textos que são estáticos (os textos em si que vão sempre ser o mesmo)
    private func setupStaticTexts() {
        /*
                    Aqui vão ser configurados os textos estáticos, ícones dos botões
                    tamanho das fontes, peso das fontes.. (para botões e labels ou até
                    mesmo para putrp elemento caso tenha)
                */
                
                /* Labels */
                

                /* Botões */
    }
      
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() {
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
    
        self.dynamicConstraints = [
            self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
