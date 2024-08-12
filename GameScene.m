//
//  GameScene.m
//  DS
//
//  Created by Vladimir Vinnik on 31.12.14.
//  Copyright (c) 2014 Vladimir Vinnik. All rights reserved.
//

#import "GameScene.h"

static const uint32_t playerBody = 0x1 << 0;
static const uint32_t targetBody = 0x1 << 1;
static const uint32_t borderBody = 0x1 << 2;

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    //Show iAd setting
    if (SHOW_AD_IN_GAMESCENE) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"showAd" object:nil];
    }
    else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"hideAd" object:nil];
    }
    
    //Initial sound class
    sound = [[Sound alloc] init];
    
    //Set gravity
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    self.physicsWorld.contactDelegate = self;
    
    //Setting scene
    [self setBackground];
    [self setLabelScore];
    
    //Start game
    [self startGame];
}

#pragma mark Nodes

//Interface nodes

-(void)setBackground {
    //Setting node
    _background = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
    _background.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    _background.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    _background.zPosition = 0;
    //Add node to scene
    [self addChild:_background];
}

-(void)setLabelScore {
    //Setting label node
    _labelScore = [SKLabelNode labelNodeWithFontNamed:FONT_NAME_BOLD];
    _labelScore.text = @"0";
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        _labelScore.fontSize = SIZE_FONT_LABEL_SCORE_GAMESCENE * 2;
    }
    else {
        _labelScore.fontSize = SIZE_FONT_LABEL_SCORE_GAMESCENE;
    }
    _labelScore.position = CGPointMake(self.frame.size.width / 2, POSITION_LABEL_HEIGHT_GAMESCENE);
    _labelScore.zPosition = 5;
    _labelScore.fontColor = COLOR_FONT_LABEL_SCORE_GAMESCENE;
    //Add node to scene
    [self addChild:_labelScore];
}

//Game nodes

-(void)setPlayer {
    //
    //Add player hands
    //
    
    //Setting mode
    _playerBack = [SKSpriteNode spriteNodeWithImageNamed:@"playerBack"];
    _playerBack.size = CGSizeMake(SIZE_OF_PLAYER_HANDS_WIDTH, SIZE_OF_PLAYER_HANDS_HEIGHT);
    _playerBack.position = CGPointMake(self.frame.size.width / 2, POSITION_PLAYER_HEIGHT);
    _playerBack.zPosition = 15;
    
    //Add node to scene
    [self addChild:_playerBack];
    
    //
    //Add back player node
    //
    
    //Setting node
    _player = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(SIZE_OF_PLAYER_WIDTH, SIZE_OF_PLAYER_HEIGHT)];
    _player.size = CGSizeMake(SIZE_OF_PLAYER_WIDTH, SIZE_OF_PLAYER_HEIGHT);
    _player.position = CGPointMake(self.frame.size.width / 2, POSITION_PLAYER_HEIGHT - SIZE_OF_PLAYER_HEIGHT / 2);
    _player.zPosition = 20;
    
    //Set physics body
    _player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_player.size];
    _player.physicsBody.categoryBitMask = playerBody;
    _player.physicsBody.contactTestBitMask = targetBody;
    _player.physicsBody.collisionBitMask = targetBody;
    _player.physicsBody.affectedByGravity = false;
    _player.physicsBody.mass = 99999999999;
    
    //Add node to scene
    [self addChild:_player];
    
    //
    //Add player hands
    //
    
    //Setting mode
    _playerFront = [SKSpriteNode spriteNodeWithImageNamed:@"playerFront"];
    _playerFront.size = CGSizeMake(SIZE_OF_PLAYER_HANDS_WIDTH, SIZE_OF_PLAYER_HANDS_HEIGHT);
    _playerFront.position = CGPointMake(self.frame.size.width / 2, POSITION_PLAYER_HEIGHT);
    _playerFront.zPosition = 25;
    
    //Add node to scene
    [self addChild:_playerFront];
}

-(void)setTarget {
    //Get random position for x
    int size = self.frame.size.width;
    int targetSize = _target.size.width;
    int positionX = (arc4random() % (size - targetSize));
    
    //Get type of target
    int nowTarget = arc4random() % 11;
    NSString *nowTargetName = [NSString stringWithFormat:@"targetNode%d", nowTarget];
    
    //Setting node
    _target = [SKSpriteNode spriteNodeWithImageNamed:nowTargetName];
    _target.size = CGSizeMake(SIZE_OF_TARGET_WIDTH, SIZE_OF_TARGET_HEIGHT);
    _target.position = CGPointMake(positionX + _target.size.width / 2, POSITION_TARGET_HEIGHT);
    _target.zPosition = 20;
    _target.name = [NSString stringWithFormat:@"%d", nowTarget];
    
    //Set physics body
    _target.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_target.size];
    _target.physicsBody.categoryBitMask = targetBody;
    _target.physicsBody.contactTestBitMask = playerBody;
    _target.physicsBody.collisionBitMask = playerBody;
    _target.physicsBody.affectedByGravity = false;
    
    //Create action
    SKAction *moveDown = [SKAction moveTo:CGPointMake(_target.position.x, (SIZE_OF_TARGET_HEIGHT * 2) * -1) duration:speedMoveTarget];
    [_target runAction:[SKAction sequence:@[moveDown, [SKAction removeFromParent]]]];
    
    //Add node to scene
    [self addChild:_target];
}

- (void)setBorder {
    //Setting node
    _border = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0] size:CGSizeMake(self.frame.size.width, self.frame.size.height / 100 * 10)];
    _border.position = CGPointMake(self.frame.size.width / 2, SIZE_OF_TARGET_HEIGHT * -1);
    _border.zPosition = 20;
    
    //Set physics body
    _border.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_border.size];
    _border.physicsBody.categoryBitMask = borderBody;
    _border.physicsBody.contactTestBitMask = targetBody;
    _border.physicsBody.collisionBitMask = targetBody;
    _border.physicsBody.affectedByGravity = false;
    _border.physicsBody.mass = 99999999999;
    
    //Add node to scene
    [self addChild:_border];
}

#pragma mark Game Process

-(void)startGame {
    //Set game setting
    gameIsPlay = true;
    score = 0;
    timeToGenerate = SPEED_GENERATION_START;
    speedMoveTarget = SPEED_TARGET_MOVE_START;
    
    //Set game nodes
    [self setPlayer];
    [self setBorder];
    
    //Begin generate targets
    timerGetNewTarget = [NSTimer scheduledTimerWithTimeInterval:timeToGenerate target:self  selector:@selector(timeToSetNewTarget) userInfo:nil repeats:false];
}

-(void)endGame {
    //Set stat
    gameIsPlay = false;
    [timerGetNewTarget invalidate];
    [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"nowScore"];
    
    //Make screen shot
    [self makeScreenShot];
    
    //Play sound
    [sound playEndGame];
    
    //Change scene
    [self changeSceneToEndGameScene];
}

- (void)makeScreenShot {
    //Get a UIImage from the UIView
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:YES];
    
    endGameScreenShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Save screen shot
    [[NSUserDefaults standardUserDefaults] setObject:UIImagePNGRepresentation(endGameScreenShot) forKey:@"nowScreenShot"];
}

-(void)changeScore {
    if (gameIsPlay) {
        //Change value
        score += 1;
        
        //Change difficult
        [self changeDifficult];
        
        //Set value to label
        _labelScore.text = [NSString stringWithFormat:@"%d", score];
        
        //Play sound
        [sound playAddScore];
    }
}

-(void)changeDifficult {
    speedMoveTarget -= SPEED_TARGET_MOVE_CHANGE;
    timeToGenerate -= SPEED_GENERATION_CHANGE;
    
    if (speedMoveTarget <= SPEED_TARGET_MOVE_LIMIT) {
        speedMoveTarget = SPEED_TARGET_MOVE_LIMIT;
    }
    if (timeToGenerate <= SPEED_GENERATION_LIMIT) {
        timeToGenerate = SPEED_GENERATION_LIMIT;
    }
}

#pragma mark Timers methods

-(void)timeToSetNewTarget {
    //Set new target
    [self setTarget];
    
    //Generate next targets
    timerGetNewTarget = [NSTimer scheduledTimerWithTimeInterval:timeToGenerate target:self  selector:@selector(timeToSetNewTarget) userInfo:nil repeats:false];
}

#pragma mark Physic Body Methods

-(void)didBeginContact:(SKPhysicsContact *)contact {
    SKSpriteNode *firstNode, *secondNode;
    
    firstNode = (SKSpriteNode *)contact.bodyA.node;
    secondNode = (SKSpriteNode *)contact.bodyB.node;
    
    //Get name of target
    int nameOfTarget = [[NSString stringWithFormat:@"%@", contact.bodyB.node.name] integerValue];
    
    if (contact.bodyB.node.position.y >= _player.position.y) {
        if (contact.bodyA.categoryBitMask == playerBody) {
            if (nameOfTarget <= 5) {
                //Remove target node and change score
                [secondNode removeFromParent];
                
                [self changeScore];
            }
            else {
                //End game if it's not fruit
                [self endGame];
            }
        }
    }
    if (contact.bodyA.categoryBitMask == borderBody) {
        if (nameOfTarget <= 5) {
            //End game if it's fruit
            [self endGame];
        }
    }
}

#pragma mark Actions

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        //Change player position
        if (gameIsPlay) {
            _playerBack.position = CGPointMake(location.x, _playerBack.position.y);
            _player.position = CGPointMake(location.x, _player.position.y);
            _playerFront.position = CGPointMake(location.x, _playerFront.position.y);
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch moved */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        //Change player position
        if (gameIsPlay) {
            _playerBack.position = CGPointMake(location.x, _playerBack.position.y);
            _player.position = CGPointMake(location.x, _player.position.y);
            _playerFront.position = CGPointMake(location.x, _playerFront.position.y);
        }
    }
}

@end
