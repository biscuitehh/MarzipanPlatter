//
//  AppDelegate.swift
//  MarzipanPlatter
//
//  Created by Michael Thomas on 6/6/18.
//  Copyright © 2018 Biscuit Labs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Setup RootViewController & Window
        let rootViewController = UITabBarController(nibName: nil, bundle: nil)
        
        let firstVC = MasterTableViewController.init(style: .plain)
        rootViewController.viewControllers = [firstVC]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }

}

