int accelteration = -10
int x_velocity = 0
int y_velocity = 0

var score = 0
var highScore = 0

let y_off = ball.size.y / 2

var changed = False

var ball = SKSpriteNode(imageNamed: "ball.jpg")

let label = SKLabelNode(fontNamed: "American Typewrite")
let highLabel = SKLabelNode(fontNamed: "American Typewrite")

override func update(){
    
    # Check if ball hits ground
    if ball.position.y - ball.size.height / 2 <= 0 {
        score = 0
    }

    # Check if it bounds off a wall
    if ball.x <= 0 {
        x_velocity *= -0.9
    }
    
    if  ball.x >= self.size.width {
        x_velocity *= -0.9
    }
    if ball.y <= {
        y_velocity *= -0.9
    }
    
    if ball.y >= self.size.height {
        y_velocity *= -0.9
    }

    ball.x += x_velocity
    ball.y += y_velocity

    y_velocity += acceleration


    if changed {
        ball.texture = SKTexture(imageNamed: "ball.jpg")
    }
}

func setup {

    ball.setuppositon ect..

    label.text = "Current Score: " + String(score)
    label.fontSize = 65
    label.fontColor = SKColor.red
    label.position = CGPoint(x: self.size.width/2, y: self.size.height/4)

    highLabel.text = "Current Score: " + String(score)
    highLabel.fontSize = 65
    highLabel.fontColor = SKColor.red
    highLabel.position = CGPoint(x: self.size.width/2, y: (self.size.height/4) + 40)

    self.addChild(label)
    self.addChild(highLabel)
}

override func touches_began(touches) {

    for touch in touches {
        let location = touch.location(in: self)

        if ball.contains(location) {
            x_velocity += (ball.position.x - location.x)
            y_velocity += (ball.y + ball.size.height) - location.y)
            score += 1
            label.text = "Current Score: " + String(score)
            if score > highScore {
                highScore += 1
                highLabel.text = "High Score: " + String(highScore)
            }
            ball.texture = SKTexture(imageNamed: "balloval.jpg")
            changed = True
        }
    }

}
