//
//  NameCollectionDataSource.swift
//  PocCollectionViewOficial
//
//  Created by Gabriel Batista on 30/08/22.
//

import Foundation
import UIKit

class NameCollectionDataSource: NSObject, UICollectionViewDataSource {
    // Chamada do protocolo para comunicar com a Controller
    var delegateViewController: ViewControllerProtocol?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let delegate = delegateViewController {
            return delegate.getData().count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: POCViewCell.identifier, for: indexPath) as? POCViewCell else {
            return UICollectionViewCell()
        }
        if let delegate = delegateViewController {
            cell.setText(text: delegate.getData()[indexPath.row])
        }
        
        return cell
    }
}


