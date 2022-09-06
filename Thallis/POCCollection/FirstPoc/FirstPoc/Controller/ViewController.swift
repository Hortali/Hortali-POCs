//
//  ViewController.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 23/08/22.
//

import UIKit

class ViewController: UIViewController, ViewControllerProtocol {
    func getDados() -> [String] {
        return self.coreData
    }
    
    func updateSelectedCell(at row: Int) {
        self.myView.setSelectedLabelText(text: self.coreData[row])
    }
    
    //MARK: - Atributos
    let myView = View()
    
    let coreData: [String] = ["Guilherme", "Leticia", "Debora", "Muza", "Gabriel", "Thallis"]
    
    let collectionDataSource = NameCollectionDataSource()
    
    let collectionDelegate = NameCollectionDelegate()
    
    override func loadView() {
//        super.loadView()
        self.view = self.myView
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(self.view.frame)
        print(self.view.safeAreaLayoutGuide.layoutFrame)
        
        
        //Instâncias das variáveis de delegate e dataSource
        self.collectionDataSource.delegateViewController = self
        self.collectionDelegate.delegateViewController = self
        
        // Atribuindo o delegate e dataSource da UIViewController
        self.myView.nameCollection.delegate = self.collectionDelegate
        self.myView.nameCollection.dataSource = self.collectionDataSource
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myView.setSelectedLabelText(text: "Nenhum nome selecionado")
        
    }
}
