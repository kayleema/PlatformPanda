//
//  Protag.m
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Protag.h"
#import "BoxGraphics.h"

@implementation Protag

@synthesize right;
@synthesize left;
@synthesize up;
@synthesize down;

@synthesize jumpSpeed;
@synthesize runSpeed;

-(void) simulateWithTimeInterval:(float)tmInt{
    [super simulateWithTimeInterval:tmInt];
    
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

-(id) initWithX:(float)x andY:(float)y{
    self.jumpSpeed = 370;
    self.runSpeed = 200;
    return [super initWithBounds:CGRectMake(x, y, 50, 75)];
}

@end
