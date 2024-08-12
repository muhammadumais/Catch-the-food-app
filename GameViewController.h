//
//  GameViewController.h
//  DS
//

//  Copyright (c) 2014 Vladimir Vinnik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <iAd/iAD.h>
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

@interface GameViewController : UIViewController <ADBannerViewDelegate> {
    ADBannerView *adView;
}

-(void)showBanner;
-(void)hidesBanner;

@end
