//
//  testCollectionDataSource.swift
//  POCSegmented
//
//  Created by Gabriel Batista on 06/09/22.
//

import Foundation
import UIKit

class TestCollectionDataSource: NSObject, UICollectionViewDataSource {
    // Chamada do protocolo para comunicar com a Controller
    var delegateViewController: ViewControllerProtocol?
    var data: [String] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
//        if let delegate = delegateViewController {
//            return delegate.data.count
//        }
//        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PocSegmentedCell.identifier, for: indexPath) as? PocSegmentedCell else {
            return UICollectionViewCell()
        }
        cell.setText(text: self.data[indexPath.row])
//        if let delegate = delegateViewController {
//            cell.setText(text: self.data[indexPath.row])
//        }
        
        return cell
    }
}
