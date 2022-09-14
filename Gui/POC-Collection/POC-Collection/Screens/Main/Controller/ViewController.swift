//
//  ViewController.swift
//  POC-Collection
//
//  Created by Gui Reis on 23/08/22.
//

import UIKit


class ViewController: UIViewController, ViewControllerDelegate {
    
    /* MARK: - Atributos */
    
    let myView = View_Personalizada()
    
    //                          0       1     2      3          4          5
    let coreData: [String] = ["Gui", "Leh", "Deh", "Muza", "Thallis", "Gabriel"]
    
    
    let collectionDataSource = NameCollectionDataSource()
    
    let collectionDelegate = NameCollectionDelegate()
    
    
    
    /* MARK: - Ciclo de Vida */
    
    override func loadView() {
        super.loadView()
        
        self.view = self.myView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Definindo textos
        self.myView.setSelectedLabelText(text: "Nenhum nome selecionado")
        
        
        // self.updateDadosCollection(with: self.coreData)
        
        self.filterData(with: "G")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.collectionDataSource.delegateViewControler = self
        
        self.myView.nameCollection.delegate = self.collectionDelegate
        self.myView.nameCollection.dataSource = self.collectionDataSource
    }
    
    
    func updateDadosCollection(with dados: [String]) {
        self.collectionDataSource.dadosDaCollection = dados
        self.myView.reloadCollection()
    }
    
    
    // Função que vai ficar na controller
    func filterData(with text: String) {
        var dadosFiltrados: [String] = []

        for item in self.coreData {
            if item.contains(text) {
                dadosFiltrados.append(item)
            }
        }
        
        self.updateDadosCollection(with: dadosFiltrados)
    }
    
    
    
    /* MARK: - Protocolo (Delegate) */
    
    func getDados() -> [String] {
        return self.coreData
    }
    
    func updateCellSelected(at row: Int) {
        self.myView.setSelectedLabelText(text: self.coreData[row])
    }
}
