//
//  AppDelegate.swift
//  Pulback
//
//  Created by Mac user on 7/29/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        let vc = EntrenceViewController(nibName: "EntrenceViewController", bundle: nil)
        let nacVC = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = nacVC
        window?.makeKeyAndVisible()

        return true
    }

   


}

