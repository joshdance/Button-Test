//
//  UIButtonExtension.swift
//  extensions dance party
//
//  Created by Joshua Dance on 9/15/17.
//  Copyright © 2017 Joshua Dance. All rights reserved.
//

import UIKit

extension UIButton {
    //animation functions
    func wiggleUp() {
        let wiggleAnimation = CABasicAnimation(keyPath: "position")
        wiggleAnimation.duration = 0.05
        wiggleAnimation.repeatCount = 1
        wiggleAnimation.autoreverses = true
        wiggleAnimation.fromValue = CGPoint(x: self.center.x, y: self.center.y)
        //- 4 is up because the origin is top left corner. - is up
        wiggleAnimation.toValue = CGPoint(x: self.center.x, y: self.center.y - 2.0)
        layer.add(wiggleAnimation, forKey: "position")
    }
    
    //animation functions
    func wiggleDown() {
        let wiggleAnimation = CABasicAnimation(keyPath: "position")
        wiggleAnimation.duration = 0.05
        wiggleAnimation.repeatCount = 1
        wiggleAnimation.autoreverses = true
        wiggleAnimation.fromValue = CGPoint(x: self.center.x, y: self.center.y)
        //+ 4 is down because the origin is top left corner. + is down
        wiggleAnimation.toValue = CGPoint(x: self.center.x, y: self.center.y + 2.0)
        layer.add(wiggleAnimation, forKey: "position")
    }
    
    //animation functions
    func wiggleSideways() {
        let wiggleAnimation = CABasicAnimation(keyPath: "position")
        wiggleAnimation.duration = 0.05
        wiggleAnimation.repeatCount = 1
        wiggleAnimation.autoreverses = true
        wiggleAnimation.fromValue = CGPoint(x: self.center.x, y: self.center.y - 1.0)
        wiggleAnimation.toValue = CGPoint(x: self.center.x, y: self.center.y + 1.0)
        layer.add(wiggleAnimation, forKey: "position")
    }
    
    //animation functions
    func wiggleNo() {
        let wiggleAnimation = CABasicAnimation(keyPath: "position")
        wiggleAnimation.duration = 0.05
        wiggleAnimation.repeatCount = 3
        wiggleAnimation.autoreverses = true
        wiggleAnimation.fromValue = CGPoint(x: self.center.x, y: self.center.y - 3.0)
        wiggleAnimation.toValue = CGPoint(x: self.center.x, y: self.center.y + 3.0)
        layer.add(wiggleAnimation, forKey: "position")
    }
    
    func dimButton() {
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 0.5
        }) { (finished) in
            UIView.animate(withDuration: 0.25, animations: {
                self.alpha = 1
            })
        } //end completion handler
    } //end dimButton
    
    func colorizeButton() {
        var colorArray = [CGFloat]()
        
        for counter in 0...2 {
            colorArray.append(generateRandomNumber())
            print(colorArray)
        }
        
        let randomColor = UIColor(red: colorArray[0]/255, green: colorArray[1]/255, blue: colorArray[2]/255, alpha: 1)
        UIView.animate(withDuration: 0.3) {
            self.backgroundColor = randomColor
        }
        
    }
}
