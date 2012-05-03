//
//  ViewController.h
//  PlatformPanda
//
//  Created by Keegan Mann on 4/27/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Level.h"

#define STATE_MAIN_MENU 0
#define STATE_WON 1
#define STATE_DEAD 2
#define STATE_RUN 3

@interface ViewController : UIViewController{
    Level* level;
    BOOL touchControl;
    int state;
}

@property BOOL touchControl;
@property int state;

-(NSArray *)elementList;
-(float) getHealth;

-(void) startGame;
-(void) stopGame:(int)newstate;

@end
