//
//  Protag.h
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Projectile.h"

@interface Protag : Projectile{
    BOOL right, left, up, down;
    int grounded;
    float jumpSpeed;
    float runSpeed;
}

@property BOOL right;
@property BOOL left;
@property BOOL up;
@property BOOL down;

@property float jumpSpeed;
@property float runSpeed;

-(id) initWithX:(float)x andY:(float)y;

-(void) simulateWithTimeInterval:(float)tmInt;

-(void) pushedBy:(Element*)elem inDirection:(int)direc;

@end
