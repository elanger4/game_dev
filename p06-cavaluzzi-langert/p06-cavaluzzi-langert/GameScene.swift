//
//  GameScene.swift
//  p06-cavaluzzi-langert
//
//  Created by Josh Cavaluzzi on 4/5/17.
//  Copyright © 2017 Joshua Cavaluzzi & Erik Langert. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // Global variables
    
    var scale_locations: [CGPoint] = [CGPoint(x:0.125, y:0.21875), CGPoint(x:0.375, y:0.21875), CGPoint(x:0.625, y:0.21875), CGPoint(x:0.875, y:0.21875), CGPoint(x:0.125, y:0.5), CGPoint(x:0.375, y:0.5), CGPoint(x:0.625, y:0.5), CGPoint(x:0.875, y:0.5), CGPoint(x:0.125, y:0.78125), CGPoint(x:0.375, y:0.78125), CGPoint(x:0.625, y:0.78125), CGPoint(x:0.875, y:0.78125)]
    
    var locations: [CGPoint]!
    
    
    // Random variables to determine gopher location
    var rand1: UInt32!
    var rand2: UInt32!
    var rand3: UInt32!
    
    // Incremented value to determine gopher location
    var newGopher1: UInt32 = 0
    var newGopher2: UInt32 = 0
    var newGopher3: UInt32 = 0
    
    // Array of Gopher objects for each Gopher on screen
//    var gophers: [Gopher]!

    // Three gophers that will appear on screen
    var gopher1: Gopher!
    var gopher2: Gopher!
    var gopher3: Gopher!
    
    // Total number of gophers on screen max
    var numGophers: UInt32 = 3
    
    // Score
    var score: UInt32 = 0
    
    // Default radius of each Plot
    var radius: CGFloat = 25.0
    
    // How many misses user has, 5 means game over
    var missed: UInt32 = 0
    var gameOver: Bool = false
    
    let background = SKSpriteNode(imageNamed: "background.jpg")

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        backgroundColor = SKColor.white
        boardSetup()
    }
    
    override func didMove(to view: SKView) {
        background.anchorPoint = CGPoint(x:0, y:0)
        background.position = CGPoint(x:0, y:0)
        background.zPosition = -2
        addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Check if game over
        if gameOver == false {
            for touch in touches {
                
                let location = touch.location(in: self)
                
                if gopher1.contains(location) {
                    gopher1.removeFromParent()
                    numGophers -= 1
                    score += 1
                }
                
                if gopher2.contains(location) {
                    gopher2.removeFromParent()
                    numGophers -= 1
                    score += 1
                }
                
                if gopher3.contains(location) {
                    gopher3.removeFromParent()
                    numGophers -= 1
                    score += 1
                }
                
                if numGophers == 0 {
                    numGophers = 3
                    createGopher1()
                    createGopher2()
                    createGopher3()
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Code goes here       
    }
    
    func createGopher1() {

        var new_loc: CGPoint!
        
        // Reset gopher location and get new random variable
        newGopher1 = 0
        rand1 = arc4random_uniform(4)
        
        for loc in scale_locations {
            if newGopher1 == rand1 {
                new_loc = CGPoint(x: loc.x * self.size.width, y: loc.y * self.size.height)
                print(new_loc)
                gopher1 = Gopher(new_loc)
                addChild(gopher1)
            }
            newGopher1 += 1
        }
    }
    
    func createGopher2() {
        
        var new_loc: CGPoint!
        
        // Reset gopher location and get new random variable
        newGopher2 = 0
        rand2 = arc4random_uniform(4) + 4
        
        for loc in scale_locations {
            if newGopher2 == rand2 {
                new_loc = CGPoint(x: loc.x * self.size.width, y: loc.y * self.size.height)
                print(new_loc)
                gopher2 = Gopher(new_loc)
                addChild(gopher2)
            }
            newGopher2 += 1
        }
    }
    
    func createGopher3() {
        
        var new_loc: CGPoint!
        
        // Reset gopher location and get new random variable
        newGopher3 = 0
        rand3 = arc4random_uniform(4) + 8
        
        for loc in scale_locations {
            if newGopher3 == rand3 {
                new_loc = CGPoint(x: loc.x * self.size.width, y: loc.y * self.size.height)
                print(new_loc)
                gopher3 = Gopher(new_loc)
                addChild(gopher3)
            }
            newGopher3 += 1
        }
    }
    
    func boardSetup() {
        // Define Gophers
        
        print("HERE")
        var v = SKSpriteNode()
        
        let h = self.size.height
        let w = self.size.width
        
        var new_loc: CGPoint!
        
        // Reset gopher location and get new random value
        newGopher1 = 0
        newGopher2 = 0
        newGopher3 = 0
        
        rand1 = arc4random_uniform(4)
        rand2 = arc4random_uniform(4) + 4
        rand3 = arc4random_uniform(4) + 8
        
        for loc in scale_locations {
            
            
            
            new_loc = CGPoint(x: loc.x * w, y: loc.y * h)
//            print(new_loc)
            
            v = SKSpriteNode(imageNamed: "dirt.jpg")
            v.position = CGPoint(x: new_loc.x, y: new_loc.y)
            v.size = CGSize(width: w/8, height: w/8)
            self.addChild(v)

            
            // ADD GOPHERS
            // Create first gopher
            if newGopher1 == rand1 {
                gopher1 = Gopher(CGPoint(x: new_loc.x, y: new_loc.y))
                print(v.position)
                self.addChild(gopher1)
            }
            newGopher1 += 1
            
            // Create second gopher
            if newGopher2 == rand2 {
                gopher2 = Gopher(CGPoint(x: new_loc.x, y: new_loc.y))
                print(v.position)
                self.addChild(gopher2)
            }
            newGopher2 += 1
            
            // Create third gopher
            if newGopher3 == rand3 {
                gopher3 = Gopher(CGPoint(x: new_loc.x, y: new_loc.y))
                print(v.position)
                self.addChild(gopher3)
            }
            newGopher3 += 1


        }
    }
}
