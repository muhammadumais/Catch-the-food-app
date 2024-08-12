//
//  Setting.h
//  DS
//
//  Created by Vladimir Vinnik on 31.12.14.
//  Copyright (c) 2014 Vladimir Vinnik. All rights reserved.
//

#ifndef DS_Setting_h
#define DS_Setting_h

//////////////////////
//                  //
//      Global      //
//                  //
//////////////////////

//Change value for showing or hide iAd banner
//  false - for hide
//  true - for show
#define SHOW_AD_IN_GAMESCENE false
#define SHOW_AD_IN_MENUSCENE true
#define SHOW_AD_IN_ENDGAMESCENE false

#define LINK_TO_RATE_US @"http://www.link.com/"

//////////////////////
//                  //
//    Interface     //
//                  //
//////////////////////

//
//Font name
//

#define FONT_NAME @"HelveticaNeue-Medium"
#define FONT_NAME_BOLD @"HelveticaNeue-Bold"

//
//Font size
//

#define SIZE_FONT_LABEL_SCORE_GAMESCENE 260

#define SIZE_FONT_LABEL_BIG_SCORE_ENDGAMESCENE 84
#define SIZE_FONT_LABEL_SMALL_SCORE_ENDGAMESCENE 18

//
//Color
//

#define COLOR_FONT_LABEL_SCORE_GAMESCENE [UIColor colorWithRed:(89/255.0) green:(65/255.0) blue:(66/255.0) alpha:1]
#define COLOR_FONT_LABEL_SCORE_ENDGAMESCENE [UIColor colorWithRed:(128/255.0) green:(101/255.0) blue:(102/255.0) alpha:1]

//
//Size
//

//Game Scene

#define SIZE_OF_PLAYER_HEIGHT self.frame.size.width / 100 * 5
#define SIZE_OF_PLAYER_WIDTH SIZE_OF_PLAYER_HANDS_WIDTH / 100 * 10

#define SIZE_OF_PLAYER_HANDS_HEIGHT self.frame.size.width / 100 * 25
#define SIZE_OF_PLAYER_HANDS_WIDTH self.frame.size.width / 100 * 210

#define SIZE_OF_TARGET_HEIGHT self.frame.size.width / 100 * 20
#define SIZE_OF_TARGET_WIDTH self.frame.size.width / 100 * 20

//Menu Scene

#define SIZE_OF_BUTTON_START_HEIGHT_MENUSCENE self.frame.size.width / 100 * 40.3
#define SIZE_OF_BUTTON_START_WIDTH_MENUSCENE self.frame.size.width / 100 * 40.3

#define SIZE_OF_BUTTON_RATEUS_WIDTH_MENUSCENE self.frame.size.width / 100 * 37.4
#define SIZE_OF_BUTTON_RATEUS_HEIGHT_MENUSCENE self.frame.size.height / 100 * 4.5

#define SIZE_OF_LOGO_HEIGHT_MENUSCENE self.frame.size.height / 100 * 28.3
#define SIZE_OF_LOGO_WIDTH_MENUSCENE self.frame.size.width / 100 * 75.3

//EndGame Scene

#define SIZE_OF_LOGO_HEIGHT_ENDGAMESCENE self.frame.size.height / 100 * 17.1
#define SIZE_OF_LOGO_WIDTH_ENDGAMESCENE self.frame.size.width / 100 * 76.3

#define SIZE_OF_BUTTON_RESTART_WIDTH_ENDGAMESCENE self.frame.size.width / 100 * 40.3
#define SIZE_OF_BUTTONS_WIDTH_ENDGAMESCENE self.frame.size.width / 100 * 37.4

#define SIZE_OF_BUTTON_SHARE_HEIGHT_ENDGAMESCENE self.frame.size.height / 100 * 6.5
#define SIZE_OF_BUTTON_MENU_HEIGHT_ENDGAMESCENE self.frame.size.height / 100 * 6.5

//
//Position
//

//Game Scene

#define POSITION_TARGET_HEIGHT self.frame.size.height + SIZE_OF_TARGET_HEIGHT
#define POSITION_PLAYER_HEIGHT self.frame.size.height / 100 * 15
#define POSITION_LABEL_HEIGHT_GAMESCENE self.frame.size.height / 100 * 50

//Menu Scene

#define POSITION_OF_LOGO_HEIGHT_MENUSCENE self.frame.size.height / 100 * 80
#define POSITION_OF_BUTTON_START_HEIGHT_MENUSCENE self.frame.size.height / 100 * 42

#define INTERVAL_OF_BUTTON_IN_MENUSCENE self.frame.size.height / 100 * 6

//EndGame Scene

#define POSITION_OF_LOGO_HEIGHT_ENDGAMESCENE self.frame.size.height / 100 * 83

#define POSITION_OF_BUTTON_WIDTH_ENDGAMESCENE self.frame.size.width / 2
#define POSITION_OF_BUTTON_HEIGHT_ENDGAMESCENE self.frame.size.height / 100 * 35.4

#define POSITION_LABEL_TOP_HEIGHT_ENDGAMESCENE self.frame.size.height / 100 * 66
#define POSITION_LABEL_DOWN_HEIGHT_ENDGAMESCENE self.frame.size.height / 100 * 53

#define POSITION_LABEL_FIRST_LINE_WIDTH_ENDGAMESCENE self.frame.size.width / 100 * 30
#define POSITION_LABEL_SECOND_LINE_WIDTH_ENDGAMESCENE self.frame.size.width / 100 * 70

#define INTERVAL_OF_BUTTON_IN_ENDGAMESCENE self.frame.size.height / 100 * 6

//////////////////////
//                  //
//   Game process   //
//                  //
//////////////////////

//
//Speed
//

#define SPEED_GENERATION_START 1.5
#define SPEED_GENERATION_CHANGE 0.1
#define SPEED_GENERATION_LIMIT 0.5

#define SPEED_TARGET_MOVE_START 3
#define SPEED_TARGET_MOVE_CHANGE 0.3
#define SPEED_TARGET_MOVE_LIMIT 0.5

#endif
