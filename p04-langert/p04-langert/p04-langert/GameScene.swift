//
//  GameScene.swift
//  p04-langert
//
//  Created by Erik Langert on 3/12/17.
//  Copyright (c) 2017 Erik Langert. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let background = SKSpriteNode(imageNamed: "mountain.png")
    let background2 = SKSpriteNode(imageNamed: "mountain.png")
    let mainChar = SKSpriteNode(imageNamed: "giraffe.jpg")
    let gameOverLabel = UILabel()
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    var burgers = [SKSpriteNode]()
    var count = 0
    var score = 0

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
    
        backgroundColor = SKColor.blackColor()
        
        background.anchorPoint = CGPointZero
        background.position = CGPointZero
        background.zPosition = -2
        addChild(background)
        
        background2.anchorPoint = CGPointZero
        background2.position = CGPointMake(background2.size.width-1, 0)
        addChild(background2)
        
        mainChar.position = CGPoint(x: 250, y: screenSize.height / 2)
        mainChar.setScale(0.25)
        addChild(mainChar)
        
/*
        let stars = SKSpriteNode(imageNamed: "stars")
        stars.anchorPoint = CGPointZero
        stars.position = CGPointZero
        stars.zPosition = -1
        addChild(stars)
        
        let moon = SKSpriteNode(imageNamed: "moon")
        moon.position = CGPoint(x: 1800, y: 1000)
        addChild(moon)
    */
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func addFood() {
        let food = SKSpriteNode(imageNamed: "burger.jpg")
        food.setScale(0.20)
        food.zPosition = 2
        
        let actualY = random(food.size.height/2, max: size.height - food.size.height/2)
        
        food.position = CGPoint(x: size.width + food.size.width/2 - 10, y: actualY)
        
        addChild(food)
        
        let actionMove = SKAction.moveBy(CGVector(dx: -food.size.width/2 - 6000, dy: 0), duration: NSTimeInterval(100))
        let actionMoveDone = SKAction.removeFromParent()
        food.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        burgers.append(food)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        for touch in touches {
            let location = touch.locationInNode(self)
            print(location)
            
            if (location.y > screenSize.height / 2) {
                mainChar.position.y += 10
            } else {
                mainChar.position.y -= 10
            }
            
            //mainChar.position = location
            
            //let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            //sprite.runAction(SKAction.repeatActionForever(action))
            
            //self.addChild(mainChar)
        }
    }
    
    func isCollision(food: SKSpriteNode) {
        if (mainChar.position.x + mainChar.size.width > food.position.x - food.size.width) {
            if (mainChar.position.y < food.position.y) {
                if (mainChar.position.y + mainChar.size.height > food.position.y) {
                    NSLog("Eaten")
                    let eaten = SKAction.removeFromParent()
                    food.runAction(eaten)
                    score += 1
                }
            } else if (mainChar.position.y > food.position.y) {
                if (mainChar.position.y < food.position.y + food.size.height) {
                    NSLog("Eaten")
                    let eaten = SKAction.removeFromParent()
                    food.runAction(eaten)
                    score += 1
                }
            }
        }
    }
    
    func gameOver() {
        let gameOverScreen = SKLabelNode(fontNamed: "Chalkduster")
        
        gameOverScreen.text = "You ate \(score) burgers!"
        gameOverScreen.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        addChild(gameOverScreen)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        if (count % 50 == 0) {
            addFood()
        }
        count+=1
        
        background.position = CGPoint(x: background.position.x - 4, y: background.position.y)
        background2.position = CGPoint(x: background2.position.x - 4, y: background2.position.y)
    
        if (background.position.x < -background.size.width) {
            background.position = CGPointMake(background2.position.x + background2.size.width, background.position.y)
        }
        
        if (background2.position.x < -background2.size.width) {
            background2.position = CGPointMake(background.position.x + background.size.width, background2.position.y)
        }
        
        for food in burgers {
            isCollision(food)
            if (food.position.x < 0) {
                gameOver()
            }
        }
    }
}
