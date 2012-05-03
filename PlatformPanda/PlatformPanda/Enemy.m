//
//  Enemy.m
//  PlatformPanda
//
//  Created by Keegan Mann on 5/2/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Enemy.h"
#import "Protag.h"
#import "ImageGraphics.h"

@implementation Enemy

-(void) setup{
    damage = 30;
}

-(void) pushedBy:(Element*)elem inDirection:(int)direc{
    if ([elem isKindOfClass:Protag.class]) {
        [((Protag*)elem) attack:damage];
    }
}

-(void) setupGraphics{
    self.graphics = [[ImageGraphics alloc] initWithImageName:@"upset.png"];
}

@end
