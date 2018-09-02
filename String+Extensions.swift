//
//  String+Extensions.swift
//  Template
//
//  Created by Igor Kotkovets on 3/18/18.
//  Copyright © 2018 Igor Kotkovets. All rights reserved.
//

import Foundation

extension String {
    static var uuid: String {
        return UUID().uuidString
    }
}
