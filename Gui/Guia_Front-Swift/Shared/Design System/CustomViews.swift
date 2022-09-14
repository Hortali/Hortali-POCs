/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Elementos de UI padronizados da aplicação
struct CustomViews {
    
    static func newLabel() -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
    
    static func newButton() -> UIButton {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }

}
