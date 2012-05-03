//
//  Key.m
//  PlatformPanda
//
//  Created by Keegan Mann on 5/2/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Key.h"
#import "ImageGraphics.h"
#import "Protag.h"
#import "Level.h"

@implementation Key

@synthesize door;

-(void) pushedBy:(Element*)elem inDirection:(int)direc{
    if ([elem isKindOfClass:Protag.class]) {
        self.door.open = YES;
        [self.mylevel.elements removeObject:self];
    }
}

-(void) setupGraphics{
    self.graphics = [[ImageGraphics alloc] initWithImageName:@"key.png"];
}

@end
