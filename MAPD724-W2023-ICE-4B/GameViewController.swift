//
//  GameViewController.swift
//  Author's name : Sarthak Vashistha
//  StudentID : 301296257
//

//
// Created by Sarthak on 5/03/23.
// Version: 1.0
//
import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    // Instance Variables
    var currentScene: GKScene?
    
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var EndLabel: UILabel!
    @IBOutlet weak var RestartButton: UIButton!
    //
    
    @IBOutlet weak var BtnTopStartConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var BtnTopRestartConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var LabelTopStartConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var LabelTopEndConstraint: NSLayoutConstraint!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        presentStartScene()
        
        CollisionManager.gameViewController = self
        if UIDevice.current.orientation.isPortrait {
            self.portraitOrientation()
        } else {
            self.LandescapeOrientation()
        }
    }

    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        var text = " "
        switch UIDevice.current.orientation{
        case .portrait:
            text = "Portrait"
            self.portraitOrientation()
        case .portraitUpsideDown:
            text = "PortraitUpsideDown"
        case .landscapeLeft:
            text = "LandscapeLeft"
            self.LandescapeOrientation()
        case .landscapeRight:
            text = "LandscapeRight"
            self.LandescapeOrientation()
        default:
            text = "Another"
        }
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if self.StartButton.isHidden == true && self.RestartButton.isHidden == true{
            self.setScene(sceneName: "GameScene")
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func setScene(sceneName: String) -> Void
    {
        currentScene = GKScene(fileNamed: sceneName)
        if let scene = currentScene!.rootNode as! SKScene?
        {
            scene.scaleMode = .aspectFill
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    func presentStartScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        StartLabel.isHidden = false
        StartButton.isHidden = false
        setScene(sceneName: "StartScene")
    }
    
    func presentEndScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        RestartButton.isHidden = false
        EndLabel.isHidden = false
        setScene(sceneName: "EndScene")
    }
    
    @IBAction func StartButton_Pressed(_ sender: UIButton)
    {
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        StartLabel.isHidden = true
        StartButton.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
    }
    
    @IBAction func RestartButton_Pressed(_ sender: UIButton)
    {
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        RestartButton.isHidden = true
        EndLabel.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
        
    }
    
    
}
extension GameViewController
{
    //Re-postions of UI commponents for Portrait mode
    func portraitOrientation() {
        self.LabelTopStartConstraint.constant = 125
        self.BtnTopStartConstraint.constant = 85
        self.LabelTopEndConstraint.constant = 125
        self.BtnTopRestartConstraint.constant = 45
    }
    
    //Re-postions of UI commponents for Landescape mode
    func LandescapeOrientation() {
        self.LabelTopStartConstraint.constant = 25
        self.BtnTopStartConstraint.constant = 45
        self.LabelTopEndConstraint.constant = 25
        self.BtnTopRestartConstraint.constant = 45
        
    }
}
