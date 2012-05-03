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

@implementation TestLevel1

- (void) loadElements{
    self.protag = [[Protag  alloc] initWithX:100 andY:0];
    
    [self addElement:self.protag];
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(-50,  150, 200,  50)]];
    [self addElement:[[Water   alloc] initWithBounds:CGRectMake(100,  150, 200,  50)]];
    
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(350,  150, 200,  50)]];
    
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(550,   20, 100,  50)]];
    [self addElement:[[Health  alloc] initWithBounds:CGRectMake(550, -130,  50,  50)]];
    
    [self addElement:[[Terrain alloc] initWithBounds:CGRectMake(750,   10, 200,  50)]];
    [self addElement:[[BouncingEnemy alloc] initWithBounds:CGRectMake(850,   -40, 50,  50)]];
    [self addElement:[[Goal    alloc] initWithBounds:CGRectMake(950,  -65,  50,  75)]];
}

@end
