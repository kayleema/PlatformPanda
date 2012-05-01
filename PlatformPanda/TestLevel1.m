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

@implementation TestLevel1

- (void) loadElements{
    self.protag = [[Protag  alloc] initWithX:100 andY:0];
    [self.elements addObject:self.protag];
    [self.elements addObject:[[Terrain alloc] initWithBounds:CGRectMake(-50, 150, 200,  50)]];
    [self.elements addObject:[[Terrain alloc] initWithBounds:CGRectMake(350, 150, 200,  50)]];
    [self.elements addObject:[[Terrain alloc] initWithBounds:CGRectMake(550, 20, 100,  50)]];
}

@end
