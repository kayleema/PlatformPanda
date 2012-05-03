//
//  BouncingEnemy.m
//  PlatformPanda
//
//  Created by Keegan Mann on 5/2/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "BouncingEnemy.h"
#import "Terrain.h"

@implementation BouncingEnemy

@synthesize jumpspeed;

-(void) pushedBy:(Element*)elem inDirection:(int)direc{
    if( [elem isKindOfClass:Terrain.class]){
        if ( direc == DIR_UP ){
            [self jump];
        }
    }
    else{
        [super pushedBy:elem inDirection:direc];
    }
}

-(void) setup{
    [super setup];
    jumpspeed = 400;
}

-(void) jump{
    self.vy = -jumpspeed;
}

@end
