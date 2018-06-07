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
        
        // Master Detail setup
        let firstVC = MasterTableViewController.init(style: .plain)
        let firstNavVC = UINavigationController(rootViewController: firstVC)
        firstNavVC.tabBarItem = UITabBarItem(title: "Table View", image: nil, tag: 0)

        // Map setup
        let secondVC = MapViewController.init(nibName: nil, bundle: nil)
        secondVC.tabBarItem = UITabBarItem(title: "Map View", image: nil, tag: 0)

        // Setup RootViewController
        let rootViewController = UITabBarController(nibName: nil, bundle: nil)
        rootViewController.viewControllers = [firstNavVC, secondVC]
        
        // Setup Window & go go go
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }

}

