//
//  NameCollectionDataSource.swift
//  POC-Collection
//
//  Created by Gui Reis on 30/08/22.
//

import UIKit

class NameCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    var delegateViewControler: ViewControllerDelegate?
    
    
    var dadosDaCollection: [String] = ["Gui", "Gabi"]
    
    
    // Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dadosDaCollection.count
//        if let delegate = delegateViewControler {
//            return delegate.getDados().count
//        }
//        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewCell.identifier, for: indexPath) as? ViewCell else {
            return UICollectionViewCell()
        }
        
        let dadoDaLinha = self.dadosDaCollection[indexPath.row] // 0: Gui | 1: Gabi
        
        cell.setTextLabel(with: dadoDaLinha)

        return cell
    }
}




