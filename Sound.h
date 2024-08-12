//
//  Sound.h
//  DS
//
//  Created by Vladimir Vinnik on 31.12.14.
//  Copyright (c) 2014 Vladimir Vinnik. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface Sound : SKScene <AVAudioRecorderDelegate, AVAudioPlayerDelegate> {
    SystemSoundID buttonClick;
    
    SystemSoundID addScore;
    SystemSoundID endGame;
    
    AVAudioPlayer *audioPlayer;
}

- (void)playButtonClick;

- (void)playAddScore;
- (void)playEndGame;

@end
