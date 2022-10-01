/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Controller responsável POR
class SegController: UIViewController {
    
    /* MARK: - Atributos */

    /* View */

    /// View principal que a classe vai controlar
    private let myView = SegView()
    
    
    /* Delegate & Data Sources */
    
    private let segNameDataSource = NameCollectionDataSource()

		
    /* MARK: - Ciclo de Vida */
    
    override func loadView() {
        self.view = self.myView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigation()
        self.setupDelegates()
        self.setupButtonsAction()
        
        self.setCollectionData(for: MainController.allAcademyStudents)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("\n\n\n>>>Seg<<<\n\n")
        self.setupCoreData()
    }
    


    /* MARK: - Protocolo */
    
    internal func updateCollection(for text: String) {
        let originalData: [String] = MainController.allAcademyStudents
        
        if text.isEmpty {
            self.setCollectionData(for: originalData)
            return
        }
        
        var filteredData: [String] = []
        
        
        for data in originalData {
            if data.lowercased() .contains(text.lowercased()) {
                filteredData.append(data)
            }
        }
        
        self.setCollectionData(for: filteredData)
    }
	

    /* MARK: - Ações de botões */
    
    @objc func segAction(sender: UISegmentedControl) {
        let itensSeg = ["A", "B", "C"]
        
        let indexSelected = sender.selectedSegmentIndex
        
        self.updateCollection(for: itensSeg[indexSelected])
    }
    
    
    /* MARK: - Configurações */
    
    
    
    /// Define os dados collection
    private func setCollectionData(for data: [String]) {
        self.segNameDataSource.setCollectionData(for: data)
        
        
        self.segNameDataSource.collectionData = data
        self.myView.nameCollection.reloadData()
        
//        reloadCollection()
    }
    

    /// Configurções da navigation controller
    private func setupNavigation() {
    
    }

    
    /// Definindo as ações dos botões
    private func setupButtonsAction() {
        self.myView.seg.addTarget(self, action: #selector(self.segAction(sender:)), for: .valueChanged)
    }
    
    
    /// Definindo os delegates, data sources e protocolos
    private func setupDelegates() {
        self.myView.nameCollection.dataSource = self.segNameDataSource
    }
    
    
    
    
    private func setupCoreData() {
        let key = "seg"
        let userDefaults = UserDefaults.standard.bool(forKey: key)
                
        
        if !userDefaults {
            let foods = ["SEG Morango", "SEG Batata", "SEG Abacaxi"]
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
