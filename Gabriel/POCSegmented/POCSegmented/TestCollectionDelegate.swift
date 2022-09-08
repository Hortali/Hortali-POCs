//
//  testCollectionDelegate.swift
//  POCSegmented
//
//  Created by Gabriel Batista on 06/09/22.
//

import Foundation
import UIKit

class TestCollectionDelegate: NSObject, UICollectionViewDelegate {
    // Chamada do protocolo para comunicar com a Controller
    var delegateViewController: ViewControllerProtocol?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegateViewController {
            delegate.updateCellSelected(at: indexPath.row)
        }
    }
    
}
