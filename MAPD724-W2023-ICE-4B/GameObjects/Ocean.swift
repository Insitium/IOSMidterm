//Ocean
/////  Author's name : Sarthak Vashistha
//  StudentID : 301296257
//
//
// Created by Sarthak on 5/03/23.
// Version: 1.0
//
import GameplayKit
import SpriteKit

class Ocean : GameObject
{
    // constructor / initializer
    init()
    {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start()
    {
        zPosition = Layer.ocean.rawValue
        verticalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -850)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.x = 850
    }
    
    func Move()
    {
        position.x -= verticalSpeed!
    }
}
