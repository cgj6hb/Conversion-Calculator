//
//  Converter.swift
//  Conversion Calculator
//
//  Created by Chris Jansson on 11/10/17.
//  Copyright © 2017 Chris Jansson. All rights reserved.
//

import Foundation

struct Converter {
    let label: String
    let inputUnit: String
    let outputUnit: String
    
    init(label: String, inputUnit: String, outputUnit: String) {
        self.label = label
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
}
