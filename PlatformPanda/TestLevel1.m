//
//  TestLevel1.m
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "TestLevel1.h"
#import "Protag.h"
#import "Terrain.h"
#import "Goal.h"
#import "Water.h"
#import "Health.h"
#import "BouncingEnemy.h"
#import "Key.h"
#import "Door.h"
#import "PaceingEnemy.h"
#import "Box.h"
#import "Tramp.h"

@implementation TestLevel1

- (void) loadElements{
    self.protag = [[Protag  alloc] initWithX:100 andY:0];
    
    Key * key =      [[Key     alloc] initWithBounds:CGRectMake(-300,   0,   50,  50)];//key
    [self addElement:key];
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(-350,-150,   50, 200)]];//wallleft
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(-300,  50,   50,  50)]];//littleped
    [self addElement:[[Water   alloc] initWithBounds:CGRectMake(-250,  100,  50,  50)]];//water
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(-200,  100, 100,  50)]];//leead
    
    [self addElement:self.protag];
    [self addElement:[[Water   alloc] initWithBounds:CGRectMake(-100, 150,  50,  50)]];//water
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(-50,  150, 200,  50)]];//plat 1
    [self addElement:[[Water   alloc] initWithBounds:CGRectMake(150,  175, 200,  50)]];//water
    
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(350,  150, 200,  50)]];//plat2
    
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(500,   70,  50, 100)]];//vertical
    
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(550,    0, 100,  50)]];//cap
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(650,    0,  50,  50)]];//cap
    Door *door =     [[Door    alloc] initWithBounds:CGRectMake(600, -100,  50, 100)];//door
    [self addElement:door];
    key.door = door;
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(600, -200,  50, 100)]];//door-head
    
    [self addElement:[[Health  alloc] initWithBounds:CGRectMake(350, -100,  50,  50)]];//health back
    
    /////////////////////////////
    
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(750,   10, 200,  50)]];
    [self addElement:[[BouncingEnemy alloc] initWithBounds:CGRectMake(850,   -40, 50,  50)]];//bouncer
    
    
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(1050,   10, 200,  50)]];
    [self addElement:[[PaceingEnemy alloc] initWithBounds:CGRectMake(1050,   -40, 50,  50)]];//squid
    
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(1350,   10, 200,  50)]];
    [self addElement:[[Tramp   alloc] initWithBounds:CGRectMake(1450,  -40, 100,  50)]];//box
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(1550,   10, 200,  50)]];
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(1550, -190,  50, 200)]];//vert
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(1550, -390,  50, 200)]];//vert
    
    
    [self addElement:[[Goal    alloc] initWithBounds:CGRectMake(1700,  -65,  50,  75)]];
}

@end
