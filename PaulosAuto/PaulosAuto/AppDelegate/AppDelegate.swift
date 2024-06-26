//
//  AppDelegate.swift
//  PaulosAuto
//
//  Created by Gonçalo Neves on 10/03/2020.
//  Copyright © 2020 Gonçalo Neves. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Add this if you only want to change Selected Image color
        // and/or selected image text
        
        let userLoginStatus = UserDefaults.standard.bool(forKey: "isUserLoggedIn")

        if(userLoginStatus)
        {
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let centerVC = mainStoryBoard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarViewController
            window!.rootViewController = centerVC
            window!.makeKeyAndVisible()
        }
        
        return true
        
    }
    
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}

