//
//  Health.m
//  PlatformPanda
//
//  Created by Keegan Mann on 5/2/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Health.h"
#import "Protag.h"
#import "Level.h"
#import "ImageGraphics.h"

@implementation Health

@synthesize power;

-(void) setup{
    self.power = 30;
}

-(void) pushedBy:(Element*)elem inDirection:(int)direc{
    if ( [elem isKindOfClass:Protag.class] ){
        [((Protag *)elem) heal:self.power];
        [self.mylevel.elements removeObject:self];
    }
}

-(void) setupGraphics{
    self.graphics = [[ImageGraphics alloc] initWithImageName:@"health.png"];
}

@end
