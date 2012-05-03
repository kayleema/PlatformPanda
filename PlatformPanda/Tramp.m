//
//  Tramp.m
//  PlatformPanda
//
//  Created by Keegan Mann on 5/3/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Tramp.h"
#import "Protag.h"
#import "ImageGraphics.h"

@implementation Tramp


-(void) pushedBy:(Element*)elem inDirection:(int)direc{
    if ( [elem isKindOfClass:Protag.class] && direc == DIR_DOWN){
        ((Protag *)elem).vy = -650;
    }
}

-(void) setupGraphics{
    self.graphics = [[ImageGraphics alloc] initWithImageName:@"tramp.png"];
}

@end
