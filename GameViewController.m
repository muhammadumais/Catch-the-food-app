//
//  GameViewController.m
//  DS
//
//  Created by Vladimir Vinnik on 31.12.14.
//  Copyright (c) 2014 Vladimir Vinnik. All rights reserved.
//

#import "GameViewController.h"
#import "MenuScene.h"

@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = NO;
    skView.showsNodeCount = NO;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    MenuScene *scene = [MenuScene unarchiveFromFile:@"MenuScene"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.size = skView.frame.size;
    
    //iAd View settings
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adView.frame = CGRectOffset(adView.frame, 0, 0.0f);
    
    //Set iAd to buttom
    adView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifierPortrait];
    adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    CGRect adFrame = adView.frame;
    adFrame.origin.y = self.view.frame.size.height-adView.frame.size.height;
    adView.frame = adFrame;
    
    adView.delegate=self;
    [adView setAlpha:0];
    [self.view addSubview:adView];
    
    //
    //Add view controller as observer
    //
    //iAd
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"hideAd" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"showAd" object:nil];
    //Share
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shareToSocial) name:@"shareToSocial" object:nil];
    //Rate app
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rateAppCall) name:@"rateUs" object:nil];
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark iAd banner methods

//Handle Notification
- (void)handleNotification:(NSNotification *)notification
{
    if ([notification.name isEqualToString:@"hideAd"]) {
        [self hidesBanner];
    }
    else if ([notification.name isEqualToString:@"showAd"]) {
        [self showBanner];
    }
}

//Hide iAd banner
-(void)hidesBanner {
    NSLog(@"Hide banner");
    [adView setAlpha:0];
}

//Show iAd banner
-(void)showBanner {
    NSLog(@"Show banner");
    [adView setAlpha:1];
}

#pragma mark Share

- (void)shareToSocial {
    NSString *textToShare = [NSString stringWithFormat:@"See, I scored %ld in Catch The Food!", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"nowScore"]];
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"nowScreenShot"];
    UIImage* image = [UIImage imageWithData:imageData];
    NSArray *objectToShare = @[textToShare, image];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:objectToShare applicationActivities:nil];
    activityViewController.excludedActivityTypes = @[];
    
    [self presentViewController:activityViewController animated:true completion:nil];
}

#pragma mark Rate Us

- (void)rateAppCall {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Like this app?" message:@"Rate this app!" delegate:self cancelButtonTitle:@"No, thanks" otherButtonTitles:@"Yes", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        //Cancel button
    }
    else if (buttonIndex == 1) {
        //Yes button
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:LINK_TO_RATE_US]];
    }
}

@end
