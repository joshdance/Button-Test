//
//  Helpers.swift
//  extensions dance party
//
//  Created by Joshua Dance on 9/16/17.
//  Copyright © 2017 Joshua Dance. All rights reserved.
//

import UIKit


func generateRandomNumber() -> CGFloat {
    let randomNumber = CGFloat(arc4random_uniform(255))
    return randomNumber
}
