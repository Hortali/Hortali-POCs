//
//  ViewController.swift
//  Poc_CollectionView
//
//  Created by Gabriel Batista on 24/08/22.
//

import UIKit


class ViewController: UIViewController, ViewControllerProtocol {
    /* MARK: Funções de protocolo */
    func getData() -> [String] {
        return self.coreData
    }
    
    func updateCellSelected(at row: Int) {
        self.myView.setupSelectedLabel(withText: self.coreData[row])
    }
    
    /* MARK: Atributos */
    let coreData = ["Gui", "Lê", "Débs", "Muza", "Thallis", "Batista"]    
    
    // Instancia das variáveis de delegate e Data source
    let collectionDataSource = NameCollectionDataSource()
    let collectionDelegate = NameCollectionDelegate()
    
    let myView = POCView()
    
    /* MARK: Ciclo de vida */
    override func loadView() {
        super.loadView()
        
        self.view = self.myView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myView.setupSelectedLabel(withText: "Nenhum texto selecionado")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // A controller configura a comunicação, informando que o protocolo de delegate e Data Source é ela mesmo.
        self.collectionDataSource.delegateViewController = self
        self.collectionDelegate.delegateViewController = self

        // Definição de onde vem o delegate e o DataSource da collection
        self.myView.nameCollection.dataSource = collectionDataSource
        self.myView.nameCollection.delegate = collectionDelegate
    }

}

