//
//  AppDelegate.swift
//  MovieDB
//
//  Created by Carlos Gamaliel on 16/07/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var mainNavigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setupView()
        
        return true
    }
    
    private func setupView() {
        let homeVC = HomePageViewController()
        
        mainNavigationController = UINavigationController(rootViewController: homeVC)
        mainNavigationController?.isNavigationBarHidden = false
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = mainNavigationController
    }
}

