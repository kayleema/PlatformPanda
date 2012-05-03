//
//  Water.m
//  PlatformPanda
//
//  Created by Keegan Mann on 5/2/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Water.h"
#import "ImageGraphics.h"
#import "Protag.h"

@implementation Water

-(void)setup{
    damage = 40;
}

-(void) setupGraphics{
    if(self.bounds.size.width == self.bounds.size.height){
        self.graphics = [[ImageGraphics alloc] initWithImageName:@"water1x1.png"];
    }
    else if(self.bounds.size.width / self.bounds.size.height == 4.0){
        self.graphics = [[ImageGraphics alloc] initWithImageName:@"water4x1.png"];
    }
    else if(self.bounds.size.width / self.bounds.size.height == 2.0){
        self.graphics = [[ImageGraphics alloc] initWithImageName:@"water2x1.png"];
    }
    else if(self.bounds.size.width / self.bounds.size.height == 0.25){
        self.graphics = [[ImageGraphics alloc] initWithImageName:@"water1x4.png"];
    }
    else if(self.bounds.size.width / self.bounds.size.height == 0.5){
        self.graphics = [[ImageGraphics alloc] initWithImageName:@"water1x2.png"];
    }
}

-(void) pushedBy:(Element*)elem inDirection:(int)direc{
    if ( [elem isKindOfClass:Protag.class] ){
        [((Protag *)elem) attack:damage];
    }
}

@end
