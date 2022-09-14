/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


extension UIButton {
    
    /// Configura a fonte e texto do botão a partir da configuração passada
    internal func setupText(with config: FontInfo) -> Void {
        if let text = config.text {
            self.setTitle(text, for: .normal)
        }
        self.titleLabel?.font = .systemFont(ofSize: config.fontSize, weight: config.weight)
    }
}
