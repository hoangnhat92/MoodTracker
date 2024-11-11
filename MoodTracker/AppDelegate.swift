//
//  AppDelegate.swift
//  MoodTracker
//
//  Created by nhat on 11/11/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
#if DEBUG
Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()
//for tvOS:
Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/tvOSInjection.bundle")?.load()
//Or for macOS:
Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/macOSInjection.bundle")?.load()
#endif
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let viewController = injectedViewController(ViewController())
        
        window?.rootViewController = viewController
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

