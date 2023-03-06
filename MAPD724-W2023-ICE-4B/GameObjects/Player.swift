import GameplayKit
import SpriteKit

class Player : GameObject
{
    // Initializer
    init()
    {
        if (UIDevice.current.orientation.isLandscape){
            super.init(imageString: "planeLandscape", initialScale: 1.0)
        }else{
            super.init(imageString: "planeLandscape", initialScale: 2.0)
        }
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func Start()
    {
        zPosition = Layer.plane.rawValue
        Reset()
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        // constrain the player on the left boundary
        if(position.x <= -320)
        {
            position.x = -320
        }
        
        // constrain the player on the right boundary
        if(position.x >= 320)
        {
            position.x = 320
        }
    }
    
    override func Reset()
    {
        if UIDevice.current.orientation.isLandscape {
            position.y = UIScreen.main.bounds.height / 5
        } else {
            position.y = UIScreen.main.bounds.height / 3

        }
    }
    
    func TouchMove(newPos: CGPoint)
    {
        if abs(newPos.y) <= 140 {
            position = newPos
        }
    }
    
}
