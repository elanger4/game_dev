//
//  GameScene.swift
//  p07-langert-cavaluzzi
//
//  Created by Josh Cavaluzzi on 4/20/17.
//  Copyright © 2017 Joshua Cavaluzzi & Erik Langert. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var gameOverLabel: SKLabelNode!
    var restartLabel: SKLabelNode!
    
    var counter = 0
    
    var gameOver = false
    var labelMade = false

    
    var colors = [Int]()
    
    let green = SKSpriteNode(imageNamed: "darkGreen.gif")
    
    let red = SKSpriteNode(imageNamed: "startred.jpeg")
    
    let blue = SKSpriteNode(imageNamed: "startBlue.png")
    
    let yellow = SKSpriteNode(imageNamed: "yellow.jpeg")
    
    override func didMove(to view: SKView) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        backgroundColor = SKColor.white
        boardSetup()
    }
    
    func boardSetup() {
        print("HERE")
        let h = self.size.height
        let w = self.size.width
        
        green.position = CGPoint(x: 0, y:h)
        green.size = CGSize(width: w, height: h)
        self.addChild(green)
        
        red.position = CGPoint(x: w, y:h)
        red.size = CGSize(width: w, height: h)
        self.addChild(red)
        
        blue.position = CGPoint(x: w, y:0)
        blue.size = CGSize(width: w, height: h)
        self.addChild(blue)
        
        
        yellow.position = CGPoint(x: 0, y:0)
        yellow.size = CGSize(width: w, height: h)
        self.addChild(yellow)
 
        restartLabel = SKLabelNode(fontNamed: "Chalkduster")
        restartLabel.text = "Restart"
        restartLabel.horizontalAlignmentMode = .left
        restartLabel.position = CGPoint(x: 0, y: 0)
        restartLabel.zPosition = 1
        self.addChild(restartLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            /*
             0 - green
             1 - red
             2 - blue
             3 - yellow
            */
            if(!gameOver) {
                
                // Check green tap
                if green.contains(location) {
                    green.texture = SKTexture(imageNamed: "Green.jpg")
                    if counter == colors.count {
                        colors.append(0)
                        counter = 0
                    } else {
                        if colors[counter] != 0 {
                            print("Game Over")
                            gameOverFunc()
                        // Game over
                        } else {
                            counter += 1
                        }
                    }
               
                // Check red tap
                } else if red.contains(location) {
                    red.texture = SKTexture(imageNamed: "brightRed.jpg")
                    if counter == colors.count {
                        colors.append(1)
                        counter = 0
                    } else {
                        if colors[counter] != 1 {
                            // Game over
                            print("Game Over")
                            gameOverFunc()
                        } else {
                            counter += 1
                        }
                    }
                
                // Check blue tap
                } else if blue.contains(location) {
                    blue.texture = SKTexture(imageNamed: "lightBlue.png")
                    if counter == colors.count {
                        colors.append(2)
                        counter = 0
                    } else {
                        if colors[counter] != 2 {
                            print("Game Over")
                            gameOverFunc()
                        } else {
                            counter += 1
                        }
                    }
                
                // Check red tap
                } else {
                    yellow.texture = SKTexture(imageNamed: "brightYellow.png")
                    if counter == colors.count {
                        colors.append(3)
                        counter = 0
                    } else {
                        if colors[counter] != 3 {
                            // Game over
                            print("Game Over")
                            gameOverFunc()
                        } else {
                            counter += 1
                        }
                    }
                }
            }
            
            // Check restart/reset
            if restartLabel.contains(location) {
                print("start reset")
                reset()
            }
        }
    }
    
    func gameOverFunc() {
        gameOver = true
        gameOverLabel = SKLabelNode(fontNamed: "Chalkduster")
        gameOverLabel.text = "Game Over"
        gameOverLabel.horizontalAlignmentMode = .right
        gameOverLabel.position = CGPoint(x: self.size.width, y: 0)
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if green.contains(location) {
                green.texture = SKTexture(imageNamed: "darkGreen.gif")
            } else if red.contains(location) {
                red.texture = SKTexture(imageNamed: "startred.jpeg")
            } else if blue.contains(location) {
                blue.texture = SKTexture(imageNamed: "startBlue.png")
            } else {
                yellow.texture = SKTexture(imageNamed:  "yellow.jpeg")
            }
        }

    }
    
    func reset() {

        print("is reset")
        counter = 0
        colors = [Int]()
        
        if(gameOver) {
            print("reset Game Over")
            gameOver = false
            gameOverLabel.removeFromParent()
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
