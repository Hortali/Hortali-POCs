//
//  ViewController.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 23/08/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    let coreData: [String] = ["Guilherme", "Leticia", "Debora", "Muza", "Gabriel", "Thallis"]
    
    //Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.coreData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewCell.identifier, for: indexPath) as? ViewCell else {
            return UICollectionViewCell()
        }
        cell.setText(with: self.coreData[indexPath.row])
        return cell
    }
    
    
    //Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.myView.setSelectedLabelText(text: self.coreData[indexPath.row])
    }
    

    let myView = View()
    
    override func loadView() {
        self.view = self.myView
        self.view.backgroundColor = .systemBackground
        self.myView.nameCollection.dataSource = self
        self.myView.nameCollection.delegate = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myView.setSelectedLabelText(text: "Nenhum nome selecionado")
        
    }

}

