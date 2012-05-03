//
//  Protag.m
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Protag.h"
#import "BoxGraphics.h"
#import "ImageGraphics.h"
#import "ImageSetGraphics.h"
#import "Level.h"
#import "Terrain.h"


@interface Protag (){
    int walkCycleLength;
    float stepLength;
    float stepLengthElapsed;
    BOOL wasJumping;
    float timeToRecover;
}
@end

@implementation Protag

@synthesize right;
@synthesize left;
@synthesize up;
@synthesize down;

@synthesize jumpSpeed;
@synthesize runSpeed;
@synthesize health;

-(void) simulateWithTimeInterval:(float)tmInt{
    [super simulateWithTimeInterval:tmInt];
    
    //recovery time
    if (timeToRecover > 0) {
        timeToRecover -= tmInt;
    }
    
    //animation
    if(left){
        ((ImageSetGraphics*)self.graphics).flipped = YES;
    }
    else if (right) {
        ((ImageSetGraphics*)self.graphics).flipped = NO;
    }
    if(self.recovering){
        ((ImageSetGraphics*)self.graphics).currentIndex = walkCycleLength + 1;
    }
    else if(grounded){
        if(wasJumping){
            wasJumping = NO;
            ((ImageSetGraphics*)self.graphics).currentIndex = 0;
        }
        stepLengthElapsed += self.vx*tmInt;
        if((stepLengthElapsed >= stepLength) || (-stepLengthElapsed >= stepLength)){
            ((ImageSetGraphics*)self.graphics).currentIndex = (((ImageSetGraphics*)self.graphics).currentIndex + 1)%walkCycleLength;
            stepLengthElapsed = 0;
        }
        if (((ImageSetGraphics*)self.graphics).currentIndex < 0){
            ((ImageSetGraphics*)self.graphics).currentIndex = walkCycleLength - 1;//loopback
        }
    }
    else {
        ((ImageSetGraphics*)self.graphics).currentIndex = walkCycleLength;//image used for jumping
        wasJumping = YES;
    }
    
    if ([self.graphics isKindOfClass:[BoxGraphics class]]) {
        if(grounded){
            if (up){
                ((BoxGraphics*)self.graphics).color = [UIColor blueColor];
            }
            else{
                ((BoxGraphics*)self.graphics).color = [UIColor yellowColor];
            }
        }
        else {
            ((BoxGraphics*)self.graphics).color = [UIColor greenColor];
        }
    } 
    
    if(up && grounded){
        [self jump];
    }
    if(left){
        self.vx = -self.runSpeed;
    }
    else if(right){
        self.vx = self.runSpeed;
    }
    else{
        self.vx = 0;
    }
    grounded = 0;
}

-(void) jump{
    self.vy = self.vy - self.jumpSpeed;
    self.bounds = CGRectOffset(self.bounds, 0, -1);
    grounded = false;
}

-(void) pushedBy:(Element*)elem inDirection:(int)direc{
    if( [elem isKindOfClass:Terrain.class]){
    if ( direc == DIR_UP ){
        grounded = 1;
        self.vy = 0.1;
    }
    else if ( direc == DIR_DOWN ) {
        if(self.vy < 0){ 
            self.vy = -self.vy;
        }
    }
    }
}

-(id) initWithX:(float)x andY:(float)y{
    self = [super initWithBounds:CGRectMake(x, y, 50, 75)];
    if (self) {
        self.jumpSpeed = 400;
        self.runSpeed = 200;
        walkCycleLength = 8;
        stepLength = 7;
        maxhealth = health = 100;
        recoveryTime = 0.5;
    }
    return self;
}

-(void) setupGraphics{
    //self.graphics = [[ImageGraphics alloc] initWithImageName:@"p1.png"];
    self.graphics = [[ImageSetGraphics alloc] initWithImageNames:
                     @"p1.png", 
                     @"p2.png", 
                     @"p3.png", 
                     @"p4.png", 
                     @"p5.png", 
                     @"p6.png", 
                     @"p7.png", 
                     @"p8.png", 
                     @"pj.png", 
                     @"pd.png",
                     nil];
    ((ImageSetGraphics *)self.graphics).currentIndex = 0;
}

-(BOOL)recovering{
    return timeToRecover > 0;
}

-(void) attack:(float)ammount{
    if (!self.recovering) {
        self.health -= ammount;
        timeToRecover = recoveryTime;
        NSLog(@"ouch %f", self.health);
        if (health < 0) {
            [self.mylevel die];
        }
    }
}

-(void) heal:(float)ammount{
    health = MIN(maxhealth, health+ammount);
}

@end
