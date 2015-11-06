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
    static let TVBaseURL = "http://localhost:9001/" // update your url here
    static let TVBootURL = "\(AppDelegate.TVBaseURL)js/main.js"
    
    
    // MARK: - UIApplication Overrides
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        /// Create the TVApplicationControllerContext
        let appControllerContext = TVApplicationControllerContext()
        
        /// Javascript Context for TVMLKit Application
        if let javaScriptURL = NSURL(string: AppDelegate.TVBootURL) {
            appControllerContext.javaScriptApplicationURL = javaScriptURL
        }
        
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL
        
        if let launchOptions = launchOptions as? [String: AnyObject] {
            for (kind, value) in launchOptions {
                appControllerContext.launchOptions[kind] = value
            }
        }
        
        /// Javascript Environment
        appController = TVApplicationController(context: appControllerContext, window: self.window, delegate: self)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // ...
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // ...
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // ...
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // ...
    }

    func applicationWillTerminate(application: UIApplication) {
        // ...
    }

    
}


//MARK: - TVApplicationDelegate -> AppDelegate Extension
typealias TVApplicationDelegate = AppDelegate
extension TVApplicationDelegate : TVApplicationControllerDelegate {
    
    func appController(appController: TVApplicationController, didFailWithError error: NSError) {
        print("\(__FUNCTION__) invoked with error: \(error)")
        
        let title = "Error Launching Application"
        let message = error.localizedDescription
        let alertController = UIAlertController(title: title, message: message, preferredStyle:.Alert )
        
        self.appController?.navigationController.presentViewController(alertController, animated: true, completion: { () -> Void in
            // ...
        })
    }
    
    func appController(appController: TVApplicationController, didStopWithOptions options: [String : AnyObject]?) {
        print("\(__FUNCTION__) invoked with options: \(options)")
    }
    
    func appController(appController: TVApplicationController, didFinishLaunchingWithOptions options: [String : AnyObject]?) {
        print("\(__FUNCTION__) invoked with options: \(options)")
    }
    
}
