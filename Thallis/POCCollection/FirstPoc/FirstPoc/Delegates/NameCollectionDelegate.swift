//
//  NameCollectionDelegate.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 30/08/22.
//

import UIKit

class NameCollectionDelegate: NSObject, UICollectionViewDelegate {
    // 2º Chamada do protocolo para comunicar com a Controller
    var delegateViewController: ViewControllerProtocol?
    
    //Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      // 4º Conexão do delegate com o da ViewController
        if let delegate = delegateViewController {
            delegate.updateSelectedCell(at: indexPath.row)
        }
    }
}
