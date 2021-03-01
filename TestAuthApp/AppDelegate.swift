//
//  AppDelegate.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 26.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window:UIWindow?
    
    fileprivate let rootController: UINavigationController = UINavigationController()
    
    fileprivate let userSession: UserSessionController = UserSessionController()
    
    lazy var launchState: AppLaunchState = {
        let launchState = LaunchState(userSession: userSession, router: Router(rootController: self.window!.rootViewController as! UINavigationController))
        return launchState
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = rootController
        self.window?.makeKeyAndVisible()
        launchState.start()
        // Override point for customization after application launch.
        return true
    }
}

