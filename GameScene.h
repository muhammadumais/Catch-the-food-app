//
//  GameScene.h
//  DS
//

//  Copyright (c) 2014 Vladimir Vinnik. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#import "GlobalScene.h"

@interface GameScene : GlobalScene <SKPhysicsContactDelegate> {
    int score;
    
    float timeToGenerate;
    float speedMoveTarget;
    BOOL gameIsPlay;
    
    NSTimer *timerGetNewTarget;
    
    UIImage *endGameScreenShot;
}

//Interface node
@property (nonatomic) SKSpriteNode *background;

@property (nonatomic) SKLabelNode *labelScore;

//Game node
@property (nonatomic) SKSpriteNode *playerBack;
@property (nonatomic) SKSpriteNode *player;
@property (nonatomic) SKSpriteNode *playerFront;
@property (nonatomic) SKSpriteNode *target;
@property (nonatomic) SKSpriteNode *border;

@end
