//
//  BoxGraphics.m
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "BoxGraphics.h"

@implementation BoxGraphics

@synthesize color;

-(id) initWithColor:(UIColor*) newcolor{
    self = [super init];
    if (self){
        color = newcolor;
    }
    return self;
}

@end
