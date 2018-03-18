//
//  Launcher.swift
//  TiresMaster
//
//  Created by Igor Kotkovets on 3/18/18.
//  Copyright © 2018 Igor Kotkovets. All rights reserved.
//

import Swinject
import Foundation

protocol LauncherInput {
    func load(window: UIWindow?)
}

class Launcher: LauncherInput {
    let resolver: Resolver

    init(withResolver resolver: Resolver) {
        self.resolver = resolver
    }

    func load(window: UIWindow?) {
        if let captureViewController = resolver.resolve(CaptureViewInput.self)?.getViewController() {
            let navigationController = UINavigationController(rootViewController: captureViewController)
            window?.rootViewController = navigationController
        }
        window?.makeKeyAndVisible()
    }
}
