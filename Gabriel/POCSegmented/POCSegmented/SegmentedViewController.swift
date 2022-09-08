/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Controller responsável POR
class SegmentedViewController: UIViewController, ViewControllerProtocol {
    func getData() -> [String] {
        return self.coredata
    }
    
    func updateCellSelected(at row: Int) {
        self.myView.setupSelectedLabel(withText: self.coredata[row])
    }
    
    
    
    
    /* MARK: - Atributos */
    let coredata = ["Moranguinho", "Bananninha", "Melancia da Adélia", "Uma manga espada", "Miójos"]
    /* View */
    
    /// View principal que a classe vai controlar
    private let myView = SegmentedView()
    
    /* Delegate & Data Sources */
    let collectionDataSource = TestCollectionDataSource()
    let collectionDelegate = TestCollectionDelegate()
    
    
    /* MARK: - Ciclo de Vida */
    
    override func loadView() {
        self.view = self.myView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupDelegates()
        self.setupButtonsAction()
        myView.setAction(target: self, action: #selector(self.changeButton(sender:)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // A controller configura a comunicação, informando que o protocolo de delegate e Data Source é ela mesmo.
        self.collectionDelegate.delegateViewController = self
        
        // Definição de onde vem o delegate e o DataSource da collection
        self.myView.testCollection.dataSource = collectionDataSource
        self.myView.testCollection.delegate = collectionDelegate
    }
    
    func updateDadosCollection(with dados: [String]) {
        self.collectionDataSource.data = dados
        self.myView.reloadCollection()
    }
    
    
    /* MARK: - Protocolo */
    /*
     Implementação das funções do protocolo que a controller está herdando.
     
     AVISO: Apague esse campo de comentário.
     */
    
    
    
    /* MARK: - Ações de botões */
    
    /*
     Implementação das funções de ações dos botões. Todas as funções que estão
     nessa área do mark devem ter o @objc apenas.
     
     AVISO: Apague esse campo de comentário.
     */
    
    
    
    /* MARK: - Configurações */
    /*
     Funções responsáveis por fazer configurações gerais.
     
     AVISO: Apague esse campo de comentário.
     */
    
    //    /// Configurções da navigation
    //    private func setupNavigation() {
    //
    //    }
    @objc func changeButton(sender: UISegmentedControl) {
        var filtered: [String] = []
        
        switch sender.selectedSegmentIndex {
        case 1:
            for item in self.coredata{
                if (item == "Melancia da Adélia" || item == "Miójos"){
                    filtered.append(item)
                }
            }
            myView.backgroundColor = .purple
        case 2:
            myView.backgroundColor = .orange
        case 3:
            myView.backgroundColor = .brown
        default:
            myView.backgroundColor = .green
        }
    }
    
    
    /// Definindo as ações dos botões
    private func setupButtonsAction() {
        
    }
    
    
    /// Definindo os delegates, data sources e protocolos
    private func setupDelegates() {
        
    }
}
