import SpriteKit

class GameScene: SKScene {
    
    let PADDING: CGFloat = 16
    
    let ORN_WIDTH: CGFloat = 120
    let ORN_HEIGHT: CGFloat = 120
    
    var ORN_SIZE: CGSize!
    var ORN_TREE_SIZE: CGSize!
    
    var tree: SKSpriteNode!
    
    var O1: SKSpriteNode!
    var O2: SKSpriteNode!
    var O3: SKSpriteNode!
    var O4: SKSpriteNode!
    var O5: SKSpriteNode!
    var O6: SKSpriteNode!
    
    var holder: SKSpriteNode!
    
    var box: SKSpriteNode!
    
    var ornaments: [SKSpriteNode]!
    
    var selected: Int?
    
    override func didMove(to view: SKView) {
        
        self.removeAllChildren()
        
        ornaments = []
        
        ORN_SIZE = CGSize(width: ORN_WIDTH, height: ORN_HEIGHT)
        ORN_TREE_SIZE = CGSize(width: ORN_WIDTH / 2, height: ORN_HEIGHT / 2)
        
        tree = SKSpriteNode(imageNamed: "tree")
        tree.size = CGSize(width: 600, height: 900)
        tree.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - tree.frame.width / 2 - 190)
        self.addChild(tree)
        
        holder = SKSpriteNode(color: UIColor.black, size: CGSize(width: self.frame.width, height: 5))
        holder.position = CGPoint(x: self.frame.midX, y: (tree.frame.minY / 2 - holder.frame.height / 2 - PADDING) * 2)
        self.addChild(holder)
        
        box = SKSpriteNode(color: UIColor.white, size: CGSize(width: self.frame.width - (PADDING * 2), height: (holder.position.y - self.frame.minY - (PADDING * 2)) / 1))
        box.position = CGPoint(x: self.frame.midX, y: holder.position.y - box.frame.height / 2 - holder.frame.height / 2 - PADDING)
        self.addChild(box)
        
        O1 = SKSpriteNode(imageNamed: "o1")
        O1.size = ORN_SIZE
        O1.position = CGPoint(x: tree.frame.minX + O1.frame.width / 2 + PADDING, y: (box.position.y + box.frame.height / 2) - O1.frame.height / 2 - PADDING)
        self.addChild(O1)
        
        O2 = SKSpriteNode(imageNamed: "o2")
        O2.size = ORN_SIZE
        O2.position = CGPoint(x: tree.frame.maxX - O2.frame.width / 2 - PADDING, y: O1.position.y)
        self.addChild(O2)
        
        O3 = SKSpriteNode(imageNamed: "o3")
        O3.size = ORN_SIZE
        O3.position = CGPoint(x: (O1.frame.midX + O2.frame.midX) / 2, y: O2.position.y)
        self.addChild(O3)
        
        O4 = SKSpriteNode(imageNamed: "o4")
        O4.size = ORN_SIZE
        O4.position = CGPoint(x: tree.frame.minX + O4.frame.width / 2 + PADDING, y: (box.position.y - box.frame.height / 2) + O4.frame.height / 2 + PADDING)
        self.addChild(O4)
        
        O5 = SKSpriteNode(imageNamed: "o5")
        O5.size = ORN_SIZE
        O5.position = CGPoint(x: tree.frame.maxX - O5.frame.width / 2 - PADDING, y: O4.position.y)
        self.addChild(O5)
        
        O6 = SKSpriteNode(imageNamed: "o6")
        O6.size = ORN_SIZE
        O6.position = CGPoint(x: (O4.frame.midX + O5.frame.midX) / 2, y: O5.position.y)
        self.addChild(O6)
        
        self.scene?.backgroundColor = UIColor.white
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let pos = touches.first!.location(in: self)
        if O1.frame.contains(pos) {
            let newObj = SKSpriteNode(imageNamed: "o1")
            newObj.size = ORN_TREE_SIZE
            newObj.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            newObj.zPosition = 4
            self.addChild(newObj)
            ornaments.append(newObj)
        } else if O2.frame.contains(pos) {
            let newObj = SKSpriteNode(imageNamed: "o2")
            newObj.size = ORN_TREE_SIZE
            newObj.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            newObj.zPosition = 4
            self.addChild(newObj)
            ornaments.append(newObj)
        } else if O3.frame.contains(pos) {
            let newObj = SKSpriteNode(imageNamed: "o3")
            newObj.size = ORN_TREE_SIZE
            newObj.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            newObj.zPosition = 4
            self.addChild(newObj)
            ornaments.append(newObj)
        } else if O4.frame.contains(pos) {
            let newObj = SKSpriteNode(imageNamed: "o4")
            newObj.size = ORN_TREE_SIZE
            newObj.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            newObj.zPosition = 4
            self.addChild(newObj)
            ornaments.append(newObj)
        } else if O5.frame.contains(pos) {
            let newObj = SKSpriteNode(imageNamed: "o5")
            newObj.size = ORN_TREE_SIZE
            newObj.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            newObj.zPosition = 4
            self.addChild(newObj)
            ornaments.append(newObj)
        } else if O6.frame.contains(pos) {
            let newObj = SKSpriteNode(imageNamed: "o6")
            newObj.size = ORN_TREE_SIZE
            newObj.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            newObj.zPosition = 4
            self.addChild(newObj)
            ornaments.append(newObj)
        } else {
            
            for (ind, i) in ornaments.enumerated() {
                if i.frame.contains(pos) {
                    selected = ind
                }
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let sel = selected {
            let pos = touches.first!.location(in: self)
            ornaments[sel].position = pos
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        selected = nil
    }
    
}
