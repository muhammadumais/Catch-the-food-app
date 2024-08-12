//
//  Sound.m
//  DS
//
//  Created by Vladimir Vinnik on 31.12.14.
//  Copyright (c) 2014 Vladimir Vinnik. All rights reserved.
//

#import "Sound.h"

@implementation Sound

- (id)init {
    self = [super init];
    if (self) {
        NSURL *buttonClickURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"buttonClick" ofType:@"mp3"]];
        NSURL *addScoreURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"addScore" ofType:@"mp3"]];
        NSURL *endGameURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"endGame" ofType:@"mp3"]];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)buttonClickURL, &buttonClick);
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)addScoreURL, &addScore);
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)endGameURL, &endGame);
    }
    
    return self;
}

//
//Play sounds
//

-(void)playButtonClick {
    AudioServicesPlaySystemSound(buttonClick);
}

- (void)playAddScore {
    AudioServicesPlaySystemSound(addScore);
}

- (void)playEndGame {
    AudioServicesPlaySystemSound(endGame);
}

@end
