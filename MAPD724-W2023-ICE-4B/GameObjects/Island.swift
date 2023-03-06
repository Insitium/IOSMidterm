//Island
//  Author's name : Sarthak Vashistha
//  StudentID : 301296257
//
//
// Created by Sarthak on 5/03/23.
// Version: 1.0
//
import GameplayKit
import SpriteKit

class Island : GameObject
{
    // initializer / constructor
    init()
    {
        if UIDevice.current.orientation.isPortrait {
            super.init(imageString: "island", initialScale: 1.5)
        } else {
            super.init(imageString: "island", initialScale: 1.0)
        }
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.island.rawValue
        verticalSpeed = 5.0
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -876)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.x = 876
        // get a pseudo random number
        let randomX:Int = (randomSource?.nextInt(upperBound: 626))! - 313
        position.y = CGFloat(randomX)
        isColliding = false
    }
    
    // public method
    func Move()
    {
        position.x -= verticalSpeed!
    }
}
