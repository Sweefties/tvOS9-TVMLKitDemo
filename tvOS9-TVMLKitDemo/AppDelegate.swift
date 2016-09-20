//
//  AppDelegate.swift
//  tvOS9-TVMLKitDemo
//
//  Created by Wlad Dicario on 13/09/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    var window: UIWindow?
    var appController : TVApplicationController?
    static let TVBaseURL = "http://localhost:9001/" // change your url here
    static let TVBootURL = "\(AppDelegate.TVBaseURL)js/main.js"
    
    
    // MARK: - UIApplication Overrides
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame:UIScreen.main.bounds)
        
        /// Create the TVApplicationControllerContext
        let appControllerContext = TVApplicationControllerContext()
        
        /// Javascript Context for TVMLKit Application
        if let javaScriptURL = URL(string: AppDelegate.TVBootURL) {
            appControllerContext.javaScriptApplicationURL = javaScriptURL
        }
        
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL
        
        if let dictionary = launchOptions as [UIApplicationLaunchOptionsKey: Any]?, let dict = dictionary as [NSString: AnyObject]? {
            for (kind, value) in dict {
                appControllerContext.launchOptions[kind as String] = value
            }
        }
        
        /// Javascript Environment
        appController = TVApplicationController(context: appControllerContext, window: self.window, delegate: self)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // ...
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // ...
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // ...
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // ...
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // ...
    }

    
}


//MARK: - TVApplicationDelegate -> AppDelegate Extension
typealias TVApplicationDelegate = AppDelegate
extension TVApplicationDelegate : TVApplicationControllerDelegate {
    
    func appController(_ appController: TVApplicationController, didFail error: Error) {
        print("\(#function) invoked with error: \(error)")
        
        let title = "Error Launching Application"
        let message = error.localizedDescription
        let alertController = UIAlertController(title: title, message: message, preferredStyle:.alert )
        
        self.appController?.navigationController.present(alertController, animated: true, completion: { () -> Void in
            // ...
        })
    }
    
    func appController(_ appController: TVApplicationController, didStop options: [String : Any]?) {
        print("\(#function) invoked with options: \(options)")
    }
    
    func appController(_ appController: TVApplicationController, didFinishLaunching options: [String : Any]?) {
        print("\(#function) invoked with options: \(options)")
    }
    
}
