/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Criando a tab bar
class MainController: UITabBarController {
    
    /* MARK: - Atributos */
    
    /// Controller da tela 01: Ver todas as hortas
    private let searchController = SearchController()
    
    /// Controller da tela 02: Ver todas os alimentos
    private let segController = SegController()
    
    
    /* DADOS */
    
    /// Nome de todos da Academy
    static let allAcademyStudents: [String] = [
        "Anna", "Bia", "Bianca", "Carol Ortega", "Carol Taus", "Claudinha", "Debora", "Felipe", "Fran", "Gabi", "Gabriel Bahia", "Gabriel Batista", "Gui Reis", "Pimenta", "Juh Santana", "Leh", "Luca", "Pera", "Marcus Chevis", "Marcus Vinicius", "Mari", "Muza", "Nathy", "Rafael", "Rebecca", "Talita", "Thallis", "Vitor GK",
    ]
    

    
    /* MARK: - Ciclo de Vida */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTab()
        self.setupTabBarItens()
        self.setupControllers()
        
        self.setupCoreData()
    }
    
    
    
    /* MARK: - Configurações */
    
    /// Configura a Tab Bar
    private func setupTab() {
        self.tabBar.backgroundColor = UIColor(.viewBack)
        self.tabBar.tintColor = UIColor(.tabSelected)
        self.tabBar.unselectedItemTintColor = UIColor(.tabNotSelected)
    }
    
    
    /// Define as controllers que vão aparecer na Tab Bar
    private func setupControllers() {
        self.viewControllers = [
            self.searchController,
            self.segController,
        ]
    }
    
    
    /// Configura os ícones e títulos de cada item da tab bar
    private func setupTabBarItens() {
        self.searchController.setupTab(text: "Search", icon: .gardenTab)
        self.segController.setupTab(text: "Seg", icon: .foodTab)
    }
    
    
    
    private func setupCoreData() {
        let key = "main"
        let userDefaults = UserDefaults.standard.bool(forKey: key)
        
        if !userDefaults {
            let foods = ["MAIN Morango", "MAIN Batata", "MAIN Abacaxi"]
            for item in foods {
                let infos = AlimentoInfo(
                    nome: item,
                    vitaminas: [
                        VitaminaInfo(tipo: "A"),
                        VitaminaInfo(tipo: "B"),
                        VitaminaInfo(tipo: "C")
                    ]
                )
                
                AlimentoCDManager.shared.addNewData(with: infos)
            }
            
            UserDefaults.standard.set(true, forKey: key)
        }
        
        self.prettyPrint()
    }
    
    
    private func prettyPrint() {
        for data in AlimentoCDManager.shared.getAllData() {
            print("""
            \(data.nome)
            \(self.getVitaminasPrint(for: data.vitaminas))
            """)
        }
    }
    
    
    private func getVitaminasPrint(for vitaminas: [VitaminaInfo]) -> String {
        var str = ""
        
        for vitamina in vitaminas {
            str.append("Vitamina \(vitamina.tipo)\n")
        }
        
        return str
    }
}
