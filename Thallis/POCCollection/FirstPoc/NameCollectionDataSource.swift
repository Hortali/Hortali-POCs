//
//  NameCollectionDataSource.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 30/08/22.
//

import UIKit

class NameCollectionDataSource: NSObject, UICollectionViewDataSource {
    // Chamada do protocolo para comunicar com a Controller
    var delegateViewController: ViewControllerProtocol?
    
    var data: [String] = []
     
    //Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewCell.identifier, for: indexPath) as? ViewCell else {
            return UICollectionViewCell()
        }
        
        let dadoDaLinha = self.data[indexPath.row]
        
        cell.setText(with: dadoDaLinha)
        
        return cell
    }
}
