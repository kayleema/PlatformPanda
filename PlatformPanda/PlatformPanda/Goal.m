//
//  Goal.m
//  PlatformPanda
//
//  Created by Keegan Mann on 5/1/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Goal.h"
#import "ImageGraphics.h"
#import "Protag.h"
#import "Level.h"

@implementation Goal

-(void) setupGraphics{
    self.graphics = [[ImageGraphics alloc] initWithImageName:@"exit.png"];
}

-(void) pushedBy:(Element*)elem inDirection:(int)direc{
    if ([elem isKindOfClass:Protag.class]) {
        [self.mylevel reachedGoal];
    }
}

@end