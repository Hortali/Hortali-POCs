/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


extension UILabel {
    
    /// Configura a fonte e texto do botão a partir da configuração passada
    internal func setupText(with config: FontInfo) -> Void {
        if let text = config.text {
            self.text = text
        }
        self.font = .systemFont(ofSize: config.fontSize, weight: config.weight)
    }
}
