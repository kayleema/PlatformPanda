//
//  PacingEnemy.m
//  PlatformPanda
//
//  Created by Keegan Mann on 5/3/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "PaceingEnemy.h"
#import "ImageSetGraphics.h"

@interface PaceingEnemy(){
    float frameCountdown;
    float framePeriod;
}

@end

@implementation PaceingEnemy

@synthesize range;
@synthesize speed;

-(void) setup{
    [super setup];
    home = self.bounds.origin;
    range = 150;
    speed = 100;
    framePeriod = 0.2;
}

-(void)simulateWithTimeInterval:(float)tmInt{
    self.vy = 0;
    if( self.bounds.origin.x <= home.x + 10 ){
        self.vx = self.speed;
    }
    else if ( self.bounds.origin.x >= home.x + range - 10 ){
        self.vx = -self.speed;
    }
    //NSLog(@"%f", self.bounds.origin.x - home.x);
    [super simulateWithTimeInterval:tmInt];
    
    //animation
    frameCountdown -= tmInt;
    if (frameCountdown <= 0) {
        frameCountdown = framePeriod;
        ((ImageSetGraphics*)self.graphics).currentIndex = (((ImageSetGraphics*)self.graphics).currentIndex+1)%4;
    }
}

-(void) setupGraphics{
    self.graphics = [[ImageSetGraphics alloc] initWithImageNames:@"alien1.png", @"alien2.png", @"alien3.png", @"alien2.png", nil];
    ((ImageSetGraphics*)self.graphics).currentIndex = 0;
}

@end
