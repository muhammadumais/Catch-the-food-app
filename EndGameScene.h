//
//  GameScene.h
//  DS
//

//  Copyright (c) 2014 Vladimir Vinnik. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#import "GlobalScene.h"

@interface EndGameScene : GlobalScene

//Iterface
@property (nonatomic) SKSpriteNode *background;
@property (nonatomic) SKSpriteNode *logo;

@property (nonatomic) SKLabelNode *labelNowScore;
@property (nonatomic) SKLabelNode *labelNowScoreCount;
@property (nonatomic) SKLabelNode *labelBestScore;
@property (nonatomic) SKLabelNode *labelBestScoreCount;

@property (nonatomic) SKSpriteNode *buttonRestart;
@property (nonatomic) SKSpriteNode *buttonMenu;
@property (nonatomic) SKSpriteNode *buttonShare;

@end
