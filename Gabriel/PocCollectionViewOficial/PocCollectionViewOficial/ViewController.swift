//
//  ViewController.swift
//  Poc_CollectionView
//
//  Created by Gabriel Batista on 24/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    let myView = POCView()
    
    override func loadView() {
        super.loadView()
        
        self.view = self.myView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myView.setupSelectedLabel(withText: "Nenhum texto selecionado")
    }


}

