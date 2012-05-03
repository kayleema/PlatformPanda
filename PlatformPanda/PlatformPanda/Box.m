//
//  Box.m
//  PlatformPanda
//
//  Created by Keegan Mann on 5/3/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Box.h"
#import "ImageGraphics.h"
#import "Terrain.h"
#import "Water.h"

@implementation Box

-(int)moveOutLevel{
    return 3;
}

-(void)setupGraphics{
    self.graphics = [[ImageGraphics alloc] initWithImageName:@"crate.png"];
}


-(void) pushedBy:(Element*)elem inDirection:(int)direc{
    if ( [elem isMemberOfClass:Terrain.class] ||  [elem isMemberOfClass:Water.class] ){
        if (direc == DIR_UP || direc == DIR_DOWN) {
            self.vy = -self.vy *0.3;
        }
        self.vx = 0;
    }
}

@end
