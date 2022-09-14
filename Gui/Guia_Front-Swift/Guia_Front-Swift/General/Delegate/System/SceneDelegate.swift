//
//  SceneDelegate.swift
//  Guia_Front-Swift
//
//  Created by Gui Reis on 01/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
            
            self.window = UIWindow(windowScene: windowScene)
            // self.window?.rootViewController = MenuViewController()
            self.window?.makeKeyAndVisible()
    }
}
