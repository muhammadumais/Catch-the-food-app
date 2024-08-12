//
//  GlobalScene.h
//  Cuneos
//
//  Created by Vladimir Vinnik on 25.10.14.
//  Copyright (c) 2014 Vladimir Vinnik. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#import "Setting.h"
#import "Sound.h"

@interface GlobalScene : SKScene {
    Sound *sound;
}


- (void)changeSceneToGameScene;
- (void)changeSceneToMenuScene;
- (void)changeSceneToEndGameScene;

@end