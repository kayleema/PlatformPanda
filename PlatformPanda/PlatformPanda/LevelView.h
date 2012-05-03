//
//  LevelView.h
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface LevelView : UIView{
    ViewController *viewController;
    CGPoint screenPosition;
    float screenStiffness;
    UIImage *frontdrop, *backdrop;
}

@property IBOutlet ViewController * viewController;
@property float screenStiffness;


-(BOOL) isMultipleTouchEnabled;

- (void) slideScreen:(CGPoint)target forTime:(float)tmInt;

-(void) loadResources;

@end
