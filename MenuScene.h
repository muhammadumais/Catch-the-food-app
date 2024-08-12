//
//  GameScene.h
//  DS
//

//  Copyright (c) 2014 Vladimir Vinnik. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#import "GlobalScene.h"

@interface MenuScene : GlobalScene

//Interface
@property (nonatomic) SKSpriteNode *background;
@property (nonatomic) SKSpriteNode *logo;
@property (nonatomic) SKSpriteNode *buttonStart;
@property (nonatomic) SKSpriteNode *buttonRateUs;

@end
