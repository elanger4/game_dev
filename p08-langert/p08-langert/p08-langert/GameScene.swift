//
//  GameScene.swift
//  p08-langert
//
//  Created by Erik Langert on 5/11/17.
//  Copyright © 2017 Erik Langert. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var acceleration = 0.0
    var x_velocity = 0.0
    var y_velocity = 0.0
    
    var score = 0
    var highScore = 0
    
    var started = false
    
    let ball = SKSpriteNode(imageNamed: "ball.png")
    
    let label = SKLabelNode(fontNamed: "American Typewriter")
    let highLabel = SKLabelNode(fontNamed: "American Typewriter")
    
    override init(size: CGSize) {
        super.init(size: size)
        
        backgroundColor = SKColor.white
        setup()
    }
    
    func setup() {
        
        ball.position = CGPoint(x: self.size.width/2, y: self.size.height/3)
        ball.size = CGSize(width: self.size.width/7, height: self.size.height/9)
        
        self.addChild(ball)
        
        label.text = "Current Score: " + String(score)
        label.fontSize = 50
        label.fontColor = SKColor.red
        label.position = CGPoint(x: self.size.width/2, y: self.size.height - self.size.height/8)
        
        highLabel.text = "High Score: " + String(highScore)
        highLabel.fontSize = 50
        highLabel.fontColor = SKColor.red
        highLabel.position = CGPoint(x: self.size.width/2, y: self.size.height - self.size.height/8 + 40)
        
        self.addChild(label)
        self.addChild(highLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if ball.position.y - ball.size.height/2 <= 0 {
            score = 0
            label.text = "Current Score: " + String(score)

        }
        
        if ball.position.x - ball.size.width/2 < 0 {
            x_velocity *= -0.8
            
            if x_velocity <= 0.1 {
                x_velocity = 1
            }
           
        }
        
        if ball.position.x + ball.size.width/2 >= self.size.width {
            x_velocity *= -0.8
            
            if  x_velocity >= -0.1 {
                x_velocity = -1
            }
        }
        
        if ball.position.y - ball.size.height/2 <= 0 {
            y_velocity *= -0.9
        }
        
        ball.position.x += CGFloat(x_velocity)
        ball.position.y += CGFloat(y_velocity)
        if y_velocity < -40 {
            y_velocity = -40
        }
        y_velocity += acceleration
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        acceleration = -2.0
        started = true
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if ball.contains(location) {
                x_velocity += Double(ball.position.x - location.x) / 2.0 + 1
                y_velocity += Double((ball.position.y + ball.size.height) - location.y) / 2.0 + 5
                
                
                score+=1
                label.text = "Current Score: " + String(score)
                
                if score > highScore {
                    highScore += 1
                    highLabel.text = "High Score: " + String(highScore)
                }
            } else {
                
                if arc4random() % 2 == 1 {
                    
                    let pmaddy = SKLabelNode(fontNamed: "Courier")
                
                    pmaddy.text = "Madden 4 Prez 2020"
                    pmaddy.fontSize = 15
                    pmaddy.fontColor = SKColor.blue
                    pmaddy.position = CGPoint(x: location.x, y: location.y)
                
                    self.addChild(pmaddy)
                
                    let rotateAction = SKAction.rotate(toAngle: CGFloat(2.0) * CGFloat(Double.pi), duration: 1)
                    let remove = SKAction.removeFromParent()
                    let sequence = SKAction.sequence([rotateAction, remove])
                    pmaddy.run(sequence)
                } else {
                    let pmaddy = SKSpriteNode(imageNamed: "pmaddy.png")
                    
                    pmaddy.position = CGPoint(x: location.x, y: location.y)
                    pmaddy.size = CGSize(width: self.size.width/10, height: self.size.height/12)
                    
                    self.addChild(pmaddy)
                    
                    let rotateAction = SKAction.rotate(toAngle: CGFloat(2.0) * CGFloat(Double.pi), duration: 1)
                    let remove = SKAction.removeFromParent()
                    let sequence = SKAction.sequence([rotateAction, remove])
                    pmaddy.run(sequence)
                }
            }
        }
    }
}






