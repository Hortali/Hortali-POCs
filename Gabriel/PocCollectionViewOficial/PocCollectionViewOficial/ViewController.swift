//
//  ViewController.swift
//  Poc_CollectionView
//
//  Created by Gabriel Batista on 24/08/22.
//

import UIKit

protocol ViewControllerDelegate: NSObject {
    func getData() -> [String]
    
    func updateCellSelected(at row: Int)
}

class ViewController: UIViewController, ViewControllerDelegate {
    func getData() -> [String] {
        return self.coreData
    }
    
    func updateCellSelected(at row: Int) {
        self.myView.setupSelectedLabel(withText: self.coreData[row])
    }
    
    /* MARK: Atributos */
    let coreData = ["Gui", "Lê", "Débs", "Muza", "Thallis", "Batista"]    
    
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
        self.collectionDataSource.delegateViewController = self
        
        self.myView.nameCollection.dataSource = collectionDataSource
        self.myView.nameCollection.delegate = collectionDelegate
    }

}

