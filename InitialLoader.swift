//
//  InitialLoader.swift
//  Template
//
//  Created by igork on 8/30/18.
//  Copyright © 2018 Igor Kotkovets. All rights reserved.
//

import Swinject
import Foundation

protocol InitialLoaderInput {
    func loadFirstScreenIn(window: UIWindow)
}

class InitialLoader: InitialLoaderInput {
    private let resolver: Resolver
    init(withResolver resolver: Resolver) {
        self.resolver = resolver
    }

    func loadFirstScreenIn(window: UIWindow) {
        
    }
}
