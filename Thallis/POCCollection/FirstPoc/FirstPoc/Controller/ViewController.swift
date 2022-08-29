//
//  ViewController.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 23/08/22.
//

import UIKit

class ViewController: UIViewController {

    let myView = View()

    
    override func loadView() {
        self.view = self.myView
        self.view.backgroundColor = .systemBackground
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myView.setSelectedLabelText(text: "Nenhum nome selecionado")
        
    }

}

