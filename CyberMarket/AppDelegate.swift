//
//  AppDelegate.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/21/20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        if let viewController = window?.rootViewController as? UINavigationController {
            appCoordinator = AppCoordinator(with: viewController)
            appCoordinator?.start()
        }
        window?.makeKeyAndVisible()
        networkReachability()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Not called under iOS 13 - See SceneDelegate sceneWillResignActive
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Not called under iOS 13 - See SceneDelegate sceneDidEnterBackground
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Not called under iOS 13 - See SceneDelegate sceneWillEnterForeground
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Not called under iOS 13 - See SceneDelegate sceneDidBecomeActive
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func networkReachability(){
        if Reachability.isConnectedToNetwork(){
            print("Internet Connection Available!")
        }else{
            let controller = UIAlertController(title: NSLocalizedString("NO_INTERNET_TITLE", comment: ""), message: NSLocalizedString("NO_INTERNET_BODY_MESSAGE", comment: ""), preferredStyle: .alert)
            let ok = UIAlertAction(title: NSLocalizedString("OK_BUTTON", comment: ""), style: .default, handler: nil)
            controller.addAction(ok)
            if let viewController = window?.rootViewController {
                viewController.present(controller, animated: true, completion: nil)
            }
        }
       
    }
}

