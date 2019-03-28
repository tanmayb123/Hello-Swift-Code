//
//  GameScene.swift
//  DragTheSquare
//
//  Created by Tanmay Bakshi on 2017-10-16.
//  Copyright © 2017 Tanmay Bakshi. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var square: SKShapeNode!
    
    override func didMove(to view: SKView) {
        square = SKShapeNode(rectOf: CGSize(width: 60, height: 60))
        square.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        square.fillColor = UIColor.red
        self.addChild(square)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchLocation = touches.first!.location(in: self)
        square.position = touchLocation
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchLocation = touches.first!.location(in: self)
        square.position = touchLocation
    }
    
}
