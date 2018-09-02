//
//  AppAppearance.swift
//  Template
//
//  Created by igork on 8/30/18.
//  Copyright © 2018 Igor Kotkovets. All rights reserved.
//

import UIKit

protocol ColorSchemeInput {
    var primary: UIColor { get }
    var secondary: UIColor { get }
    var text: UIColor { get }
    var barText: UIColor { get }
    var exerciseContentView: UIColor { get }
    var headerBackground: UIColor { get }
    // and more
}

class AppAppearance {
    func apply(scheme: ColorSchemeInput) {
//        UINavigationBar.appearance(whenContainedInInstancesOf: [ExercisesNavigationController.self]).barTintColor = scheme.primary
    }
}
