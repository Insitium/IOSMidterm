//Cloud
//Author's name : Sarthak Vashistha
//  StudentID : 301296257
//
//
// Created by Sarthak on 5/03/23.
// Version: 1.0
//
import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    // initializer / constructor
    init()
    {
        if UIDevice.current.orientation.isLandscape {
            super.init(imageString: "cloud", initialScale: 0.6)
        } else{
            super.init(imageString: "cloud", initialScale: 1.0)
        }
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5 // 50% transparent
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -902)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // randomize the vertical speed: 5 to 10
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        // randomize the horizontal speed: -2 to 2
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0 
        
        // get a pseudo random number for the X position: -262 to 262
        let randomX:Int = (randomSource?.nextInt(upperBound: 180))! - 100
        position.x = CGFloat(randomX)
        
        // get a pseudo random number for the Y position: 902 to 932
        let randomY:Int = (randomSource?.nextInt(upperBound: 30))! + 902
        position.x = CGFloat(randomY)
        
        isColliding = false
    }
    
    // public method
    func Move()
    {
        position.y -= horizontalSpeed!
        position.x -= verticalSpeed!
    }
}
