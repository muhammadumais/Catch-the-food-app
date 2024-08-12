//
//  GameScene.m
//  DS
//
//  Created by Vladimir Vinnik on 31.12.14.
//  Copyright (c) 2014 Vladimir Vinnik. All rights reserved.
//

#import "EndGameScene.h"

@implementation EndGameScene

-(void)didMoveToView:(SKView *)view {
    //Show iAd setting
    if (SHOW_AD_IN_ENDGAMESCENE) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"showAd" object:nil];
    }
    else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"hideAd" object:nil];
    }
    
    //Initial sound class
    sound = [[Sound alloc] init];
    
    //Set best score
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"nowScore"] > [[NSUserDefaults standardUserDefaults] integerForKey:@"bestScore"]) {
        [[NSUserDefaults standardUserDefaults] setInteger:[[NSUserDefaults standardUserDefaults] integerForKey:@"nowScore"] forKey:@"bestScore"];
    }
    
    //Set nodes
    [self setBackground];
    [self setLogo];
    [self setLabels];
    
    [self setButtonRestart];
    [self setButtonMenu];
    [self setButtonShare];
}

#pragma mark Node

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
    _logo = [SKSpriteNode spriteNodeWithImageNamed:@"logoEndGame"];
    _logo.size = CGSizeMake(SIZE_OF_LOGO_WIDTH_ENDGAMESCENE, SIZE_OF_LOGO_HEIGHT_ENDGAMESCENE);
    _logo.position = CGPointMake(self.frame.size.width / 2, POSITION_OF_LOGO_HEIGHT_ENDGAMESCENE);
    _logo.zPosition = 5;
    //Add node to scene
    [self addChild:_logo];
}

-(void)setLabels {
    //Now score
    
    //Setting node
    _labelNowScore = [SKLabelNode labelNodeWithFontNamed:FONT_NAME];
    _labelNowScore.text = @"NOW SCORE";
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        _labelNowScore.fontSize = SIZE_FONT_LABEL_SMALL_SCORE_ENDGAMESCENE * 2;
    }
    else {
        _labelNowScore.fontSize = SIZE_FONT_LABEL_SMALL_SCORE_ENDGAMESCENE;
    }
    _labelNowScore.zPosition = 5;
    _labelNowScore.fontColor = COLOR_FONT_LABEL_SCORE_ENDGAMESCENE;
    _labelNowScore.position = CGPointMake(POSITION_LABEL_FIRST_LINE_WIDTH_ENDGAMESCENE, POSITION_LABEL_TOP_HEIGHT_ENDGAMESCENE);
    //Add node to scene
    [self addChild:_labelNowScore];
    
    //Setting node
    _labelNowScoreCount = [SKLabelNode labelNodeWithFontNamed:FONT_NAME_BOLD];
    _labelNowScoreCount.text = [NSString stringWithFormat:@"%d", [[NSUserDefaults standardUserDefaults] integerForKey:@"nowScore"]];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        _labelNowScoreCount.fontSize = SIZE_FONT_LABEL_BIG_SCORE_ENDGAMESCENE * 2;
    }
    else {
        _labelNowScoreCount.fontSize = SIZE_FONT_LABEL_BIG_SCORE_ENDGAMESCENE;
    }
    _labelNowScoreCount.zPosition = 5;
    _labelNowScoreCount.fontColor = COLOR_FONT_LABEL_SCORE_ENDGAMESCENE;
    _labelNowScoreCount.position = CGPointMake(POSITION_LABEL_FIRST_LINE_WIDTH_ENDGAMESCENE, POSITION_LABEL_DOWN_HEIGHT_ENDGAMESCENE);
    //Add node to scene
    [self addChild:_labelNowScoreCount];
    
    //Best score
    
    //Setting node
    _labelBestScore = [SKLabelNode labelNodeWithFontNamed:FONT_NAME];
    _labelBestScore.text = @"BEST SCORE";
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        _labelBestScore.fontSize = SIZE_FONT_LABEL_SMALL_SCORE_ENDGAMESCENE * 2;
    }
    else {
        _labelBestScore.fontSize = SIZE_FONT_LABEL_SMALL_SCORE_ENDGAMESCENE;
    }
    _labelBestScore.zPosition = 5;
    _labelBestScore.fontColor = COLOR_FONT_LABEL_SCORE_ENDGAMESCENE;
    _labelBestScore.position = CGPointMake(POSITION_LABEL_SECOND_LINE_WIDTH_ENDGAMESCENE, POSITION_LABEL_TOP_HEIGHT_ENDGAMESCENE);
    //Add node to scene
    [self addChild:_labelBestScore];
    
    //Setting node
    _labelBestScoreCount = [SKLabelNode labelNodeWithFontNamed:FONT_NAME_BOLD];
    _labelBestScoreCount.text = [NSString stringWithFormat:@"%d", [[NSUserDefaults standardUserDefaults] integerForKey:@"bestScore"]];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        _labelBestScoreCount.fontSize = SIZE_FONT_LABEL_BIG_SCORE_ENDGAMESCENE * 2;
    }
    else {
        _labelBestScoreCount.fontSize = SIZE_FONT_LABEL_BIG_SCORE_ENDGAMESCENE;
    }
    _labelBestScoreCount.zPosition = 5;
    _labelBestScoreCount.fontColor = COLOR_FONT_LABEL_SCORE_ENDGAMESCENE;
    _labelBestScoreCount.position = CGPointMake(POSITION_LABEL_SECOND_LINE_WIDTH_ENDGAMESCENE, POSITION_LABEL_DOWN_HEIGHT_ENDGAMESCENE);
    //Add node to scene
    [self addChild:_labelBestScoreCount];
}

-(void)setButtonRestart {
    //Setting node
    _buttonRestart = [SKSpriteNode spriteNodeWithImageNamed:@"buttonRestart"];
    _buttonRestart.size = CGSizeMake(SIZE_OF_BUTTON_RESTART_WIDTH_ENDGAMESCENE, SIZE_OF_BUTTON_RESTART_WIDTH_ENDGAMESCENE);
    _buttonRestart.position = CGPointMake(POSITION_OF_BUTTON_WIDTH_ENDGAMESCENE, POSITION_OF_BUTTON_HEIGHT_ENDGAMESCENE);
    _buttonRestart.zPosition = 20;
    //Add node to scene
    [self addChild:_buttonRestart];
}

-(void)setButtonMenu {
    //Setting node
    _buttonMenu = [SKSpriteNode spriteNodeWithImageNamed:@"buttonMenu"];
    _buttonMenu.size = CGSizeMake(SIZE_OF_BUTTONS_WIDTH_ENDGAMESCENE, SIZE_OF_BUTTON_MENU_HEIGHT_ENDGAMESCENE);
    _buttonMenu.position = CGPointMake(POSITION_OF_BUTTON_WIDTH_ENDGAMESCENE, POSITION_OF_BUTTON_HEIGHT_ENDGAMESCENE - (INTERVAL_OF_BUTTON_IN_ENDGAMESCENE + SIZE_OF_BUTTONS_WIDTH_ENDGAMESCENE / 2) - (INTERVAL_OF_BUTTON_IN_ENDGAMESCENE + SIZE_OF_BUTTON_SHARE_HEIGHT_ENDGAMESCENE / 2));
    _buttonMenu.zPosition = 20;
    //Add node to scene
    [self addChild:_buttonMenu];
}

-(void)setButtonShare {
    //Setting node
    _buttonShare = [SKSpriteNode spriteNodeWithImageNamed:@"buttonShare"];
    _buttonShare.size = CGSizeMake(SIZE_OF_BUTTONS_WIDTH_ENDGAMESCENE, SIZE_OF_BUTTON_SHARE_HEIGHT_ENDGAMESCENE);
    _buttonShare.position = CGPointMake(POSITION_OF_BUTTON_WIDTH_ENDGAMESCENE, POSITION_OF_BUTTON_HEIGHT_ENDGAMESCENE - (INTERVAL_OF_BUTTON_IN_ENDGAMESCENE + SIZE_OF_BUTTONS_WIDTH_ENDGAMESCENE / 2));
    _buttonShare.zPosition = 20;
    //Add node to scene
    [self addChild:_buttonShare];
}

#pragma mark Actions

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if ([_buttonRestart containsPoint:location]) {
            //Play sound
            [sound playButtonClick];
            
            //Change scene
            [self changeSceneToGameScene];
        }
        if ([_buttonMenu containsPoint:location]) {
            //Play sound
            [sound playButtonClick];
            
            //Change scene
            [self changeSceneToMenuScene];
        }
        if ([_buttonShare containsPoint:location]) {
            //Play sound
            [sound playButtonClick];
            
            //Share
            [[NSNotificationCenter defaultCenter] postNotificationName:@"shareToSocial" object:nil];
        }
    }
}

@end
