//
//  AppDelegate.swift
//  babylon
//
//  Created by Francesco on 13/01/17.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //set up navigation bar appearance
        UINavigationBar.appearance().barTintColor = Color.materialDeepPurple.darken1
        UINavigationBar.appearance().tintColor = Color.white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: Color.white, NSFontAttributeName: UIFont(name: "Futura", size: 20)!]
        
        return true
    }

}

