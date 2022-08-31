//
//  NameCollectionDataSource.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 30/08/22.
//

import UIKit

class NameCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    var delegateViewController: ViewControllerDelegate?
    
    
    //Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 
        if let delegate = delegateViewController {
            return delegate.getDados().count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewCell.identifier, for: indexPath) as? ViewCell else {
            return UICollectionViewCell()
        }
        
        if let delegate = delegateViewController {
            cell.setText(with: delegate.getDados()[indexPath.row])
        }
            
        return cell
    }
}
