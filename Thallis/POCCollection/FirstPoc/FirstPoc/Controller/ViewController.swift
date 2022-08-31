//
//  ViewController.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 23/08/22.
//

import UIKit

protocol ViewControllerDelegate: NSObject {
    
    func getDados() -> [String] //é uma lista de string porque no nosso coreData (na View Controller) é uma lista de strings
     
    func updateSelectedCell(at row: Int)
    
}

class ViewController: UIViewController, ViewControllerDelegate {
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
        super.loadView()
        self.view = self.myView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.collectionDataSource.delegateViewController = self
        
        self.myView.nameCollection.delegate = self.collectionDelegate
        
        self.myView.nameCollection.dataSource = self.collectionDataSource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myView.setSelectedLabelText(text: "Nenhum nome selecionado")
        
    }

}

