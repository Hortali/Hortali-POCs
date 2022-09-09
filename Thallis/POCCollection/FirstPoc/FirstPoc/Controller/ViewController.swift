//
//  ViewController.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 23/08/22.
//

import UIKit

class ViewController: UIViewController, ViewControllerProtocol, UISearchBarDelegate {
    
    func getDados() -> [String] {
        return self.coreData
    }
    
    func updateSelectedCell(at row: Int) {
        self.myView.setSelectedLabelText(text: self.coreData[row])
    }
    
    
    //MARK: - Atributos
    let myView = View()
    
    var coreData: [String] = ["Débora", "Gabriel", "Guilherme", "Leticia", "Muza", "Thallis"]
    
    var filteredCoreData = [String]()
    
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
        
        
        //MARK: NOVO - 1o passo:  Instâncias das variáveis de delegate e dataSource
        self.collectionDataSource.data = self.coreData
        
        // MARK: Novo - 3o passo
        self.myView.reloadCollection()
        
        self.collectionDataSource.delegateViewController = self
        self.collectionDelegate.delegateViewController = self //novo
        
        // Atribuindo o delegate e dataSource da UIViewController
        self.myView.nameCollection.delegate = self.collectionDelegate
        self.myView.nameCollection.dataSource = self.collectionDataSource
        
        
    }
    
    func updateCollectionData(with data: [String]) {
        self.collectionDataSource.data = data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myView.setSelectedLabelText(text: "Nenhum nome selecionado")
        configureSearchController()
        
    }
    
    private func configureSearchController() {
        
        self.myView.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchText = searchBar.text
        
        var filteredCoreData = coreData
        
        if searchText == "" {
            filteredCoreData = coreData
        }else{
            filteredCoreData = []
            for item in coreData{
                if item.contains(searchText ?? ""){
                    filteredCoreData.append(item)
                    print(item)
                }
            }
            self.myView.nameCollection.reloadData()
            
        }
    }
}
