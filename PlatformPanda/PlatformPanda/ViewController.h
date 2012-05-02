//
//  ViewController.h
//  PlatformPanda
//
//  Created by Keegan Mann on 4/27/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Level.h"

@interface ViewController : UIViewController{
    Level* level;
    BOOL touchControl;
}

@property BOOL touchControl;

-(NSArray *)elementList;

-(void) startGame;
-(void) stopGame;

@end
