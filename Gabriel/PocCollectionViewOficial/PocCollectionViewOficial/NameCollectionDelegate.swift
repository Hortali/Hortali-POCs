//
//  NameCollectionDelegate.swift
//  PocCollectionViewOficial
//
//  Created by Gabriel Batista on 30/08/22.

import Foundation
import UIKit

class NameCollectionDelegate: NSObject, UICollectionViewDelegate {
    // Chamada do protocolo para comunicar com a Controller
    var delegateViewController: ViewControllerProtocol?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegateViewController {
            delegate.updateCellSelected(at: indexPath.row)
        }
    }
    
}
