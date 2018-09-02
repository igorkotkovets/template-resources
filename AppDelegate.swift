//
//  AppDelegate.swift
//  Template
//
//  Created by Igor Kotkovets on 3/18/18.
//  Copyright © 2018 Igor Kotkovets. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = {UIWindow(frame: UIScreen.main.bounds)}()
    let diResolver = {
        Assembler([CoreAssembly()]).resolver
    }()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        AppAppearance().apply(scheme: DefaultColorScheme())
        let launcher = diResolver.resolve(LauncherInput.self)
        launcher?.load(window: window)
        return true
    }
}

