//
//  AppDelegate.swift
//  Scout
//
//  Created by Hieu Rocker on 4/6/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import UIKit
import GoogleMaps
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    if !PrivateConfig.initConfig() {
      print("PrivateConfig.plist is missing.")
      return false
    }
    BuddyBuildSDK.setup()
    GMSServices.provideAPIKey(PrivateConfig.GMSApiKey!)
    ParserClient.initialize(launchOptions)
    var vc: UIViewController
    if User.localUser != nil {
      vc = MainViewController(nibName: "MainViewController", bundle: nil)
    } else {
      vc = WelcomeViewController(nibName: "WelcomeViewController", bundle: nil)
    }
    
    window?.rootViewController = vc
    UINavigationBar.appearance().titleTextAttributes = [
      NSFontAttributeName: UIFont(name: "CircularAir-Book", size: 17)!
    ]
    UINavigationBar.appearance().tintColor = UIColor(red:1.00, green:0.35, blue:0.37, alpha:1.0)
   

    return true
  }
  
  func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
    return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
  }
  
  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    FBSDKAppEvents.activateApp()
  }
  
  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
}

