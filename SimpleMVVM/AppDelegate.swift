//
//  AppDelegate.swift
//  SimpleMVVM
//
//  Created by Дмитрий Станкевич on 10.02.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
        if let window = window {
            window.rootViewController = ViewController()
            window.makeKeyAndVisible()
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle



}

