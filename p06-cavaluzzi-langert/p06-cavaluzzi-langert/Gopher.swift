//
//  Gopher.swift
//  p06-cavaluzzi-langert
//
//  Created by Josh Cavaluzzi on 4/5/17.
//  Copyright © 2017 Joshua Cavaluzzi & Erik Langert. All rights reserved.
//

import SpriteKit

class Gopher: SKNode {
    var center: CGPoint!
    var rect: CGRect!
 
    init(_ loc: CGPoint) {
        super.init()
        let sprite = SKSpriteNode(imageNamed: "gopher.png")
        self.addChild(sprite)
        self.position = loc
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
