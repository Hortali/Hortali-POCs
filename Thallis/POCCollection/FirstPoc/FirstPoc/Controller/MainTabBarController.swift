//
//  MainTabBarController.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 05/09/22.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    private let discover = ViewController()
    
    override func viewDidLoad() {

        viewControllers = [discover]
        
        self.tabBar.backgroundColor = .red
        
        
    }
}
