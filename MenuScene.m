//
//  GameScene.m
//  DS
//
//  Created by Vladimir Vinnik on 31.12.14.
//  Copyright (c) 2014 Vladimir Vinnik. All rights reserved.
//

#import "MenuScene.h"

@implementation MenuScene

-(void)didMoveToView:(SKView *)view {
    //Show iAd setting
    if (SHOW_AD_IN_MENUSCENE) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"showAd" object:nil];
    }
    else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"hideAd" object:nil];
    }
    
    //Initial sound class
    sound = [[Sound alloc] init];
    
    //Add nodes
    [self setBackground];
    [self setLogo];
    [self setButtonStart];
    [self setButtonRateUs];
}

#pragma mark Nodes

-(void)setBackground {
    //Setting node
    _background = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
    _background.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    _background.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    _background.zPosition = 0;
    //Add node to scene
    [self addChild:_background];
}

-(void)setLogo {
    //Setting node
    _logo = [SKSpriteNode spriteNodeWithImageNamed:@"logoMain"];
    _logo.size = CGSizeMake(SIZE_OF_LOGO_WIDTH_MENUSCENE, SIZE_OF_LOGO_HEIGHT_MENUSCENE);
    _logo.position = CGPointMake(self.frame.size.width / 2, POSITION_OF_LOGO_HEIGHT_MENUSCENE);
    _logo.zPosition = 5;
    //Add node to scene
    [self addChild:_logo];
}

-(void)setButtonStart {
    //Setting node
    _buttonStart = [SKSpriteNode spriteNodeWithImageNamed:@"buttonStart"];
    _buttonStart.size = CGSizeMake(SIZE_OF_BUTTON_START_WIDTH_MENUSCENE, SIZE_OF_BUTTON_START_HEIGHT_MENUSCENE);
    _buttonStart.position = CGPointMake(self.frame.size.width / 2, POSITION_OF_BUTTON_START_HEIGHT_MENUSCENE);
    _buttonStart.zPosition = 5;
    //Add node to scene
    [self addChild:_buttonStart];
}

-(void)setButtonRateUs {
    //Setting node
    _buttonRateUs = [SKSpriteNode spriteNodeWithImageNamed:@"buttonRateUs"];
    _buttonRateUs.size = CGSizeMake(SIZE_OF_BUTTON_RATEUS_WIDTH_MENUSCENE, SIZE_OF_BUTTON_RATEUS_HEIGHT_MENUSCENE);
    _buttonRateUs.position = CGPointMake(self.frame.size.width / 2, POSITION_OF_BUTTON_START_HEIGHT_MENUSCENE - (INTERVAL_OF_BUTTON_IN_MENUSCENE + SIZE_OF_BUTTON_RATEUS_WIDTH_MENUSCENE / 2));
    _buttonRateUs.zPosition = 20;
    //Add node to scene
    [self addChild:_buttonRateUs];
}

#pragma mark Actions

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if ([_buttonStart containsPoint:location]) {
            //Play sound
            [sound playButtonClick];
            
            //Change scene
            [self changeSceneToGameScene];
        }
        if ([_buttonRateUs containsPoint:location]) {
            //Play sound
            [sound playButtonClick];
            
            //Rate
            [[NSNotificationCenter defaultCenter] postNotificationName:@"rateUs" object:nil];
        }
    }
}

@end
