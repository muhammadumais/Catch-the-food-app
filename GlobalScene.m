//
//  GlobalScene.m
//  Cuneos
//
//  Created by Vladimir Vinnik on 25.10.14.
//  Copyright (c) 2014 Vladimir Vinnik. All rights reserved.
//

#import "GlobalScene.h"

#import "GameScene.h"
#import "MenuScene.h"
#import "EndGameScene.h"

@interface GlobalScene ()

@end

@implementation GlobalScene

#pragma mark Change Scene

- (void)changeSceneToGameScene {
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    // Create and configure the scene.
    SKTransition *reveal = [SKTransition pushWithDirection:SKTransitionDirectionUp duration:1];
    SKScene *level = [[GameScene alloc] initWithSize:skView.bounds.size];
    
    [self.view presentScene:level transition:reveal];
}

- (void)changeSceneToMenuScene {
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    // Create and configure the scene.
    SKTransition *reveal = [SKTransition pushWithDirection:SKTransitionDirectionUp duration:1];
    SKScene *level = [[MenuScene alloc] initWithSize:skView.bounds.size];
    
    [self.view presentScene:level transition:reveal];
}

- (void)changeSceneToEndGameScene {
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    // Create and configure the scene.
    SKTransition *reveal = [SKTransition pushWithDirection:SKTransitionDirectionUp duration:1];
    SKScene *level = [[EndGameScene alloc] initWithSize:skView.bounds.size];
    
    [self.view presentScene:level transition:reveal];
}

@end
