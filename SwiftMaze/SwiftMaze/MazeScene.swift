//
//  MazeScene.swift
//  SwiftMaze
//
//  Created by Enkhjargal Gansukh on 2/16/16.
//  Copyright © 2016 Enkhjargal Gansukh. All rights reserved.
//


import SpriteKit
import CoreMotion

class MazeScene: SKScene, SKPhysicsContactDelegate{
    
    let manager = CMMotionManager()
    var ball = SKSpriteNode()
    var endNode = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        
        
        self.physicsWorld.contactDelegate = self
        
        ball = self.childNodeWithName("ball") as! SKSpriteNode
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()){
            (data, error) in
            
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!) * 10, CGFloat((data?.acceleration.y)!) * 10)
            
        }
        
    }
}
