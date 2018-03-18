//
//  CoreAssembly.swift
//  TiresMaster
//
//  Created by Igor Kotkovets on 3/18/18.
//  Copyright © 2018 Igor Kotkovets. All rights reserved.
//

import Swinject
import Foundation

class CoreAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LauncherInput.self) {
            return Launcher(withResolver: $0)
        }
    }
}
