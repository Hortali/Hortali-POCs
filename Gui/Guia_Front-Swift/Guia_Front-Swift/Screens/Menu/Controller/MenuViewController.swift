/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


class MenuViewController: UIViewController {
    
    private let myView = MenuView()
    
    
    
    
    override func loadView() {
        super.loadView()
        
        self.view = self.myView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }    
     
        
    /* MARK: - Ações de botões */
    
    
    
    /* MARK: - Configurações */
    
    /// Definindo as ações dos botões
    private func setupButtonsAction() {
      
    }
    
    
    /// Definindo os delegates e protocols
    private func setupDelegates() {
    
    }
}
