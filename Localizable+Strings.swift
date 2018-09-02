//
//  Localizable+Strings.swift
//  Template
//
//  Created by igork on 8/31/18.
//  Copyright © 2018 Igor Kotkovets. All rights reserved.
//

import Foundation

extension String {
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

class Localizable {
//    static let exercisesListNavigationBarEdit = "ExercisesList.NavigationBar.Edit".localized()
}
