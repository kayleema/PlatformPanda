//
//  Terrain.m
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Terrain.h"
#import "ImageGraphics.h"

@implementation Terrain

-(id) initWithBounds:(CGRect)newbounds{
    self = [super initWithBounds:newbounds];
    if (self) {
        //
    }
    return self;
}

-(void) setupGraphics{
    if(self.bounds.size.width == self.bounds.size.height){
        self.graphics = [[ImageGraphics alloc] initWithImageName:@"rock1x1.png"];
    }
    else if(self.bounds.size.width / self.bounds.size.height == 4.0){
        self.graphics = [[ImageGraphics alloc] initWithImageName:@"rock4x1.png"];
    }
    else if(self.bounds.size.width / self.bounds.size.height == 2.0){
        self.graphics = [[ImageGraphics alloc] initWithImageName:@"rock2x1.png"];
    }
    else if(self.bounds.size.width / self.bounds.size.height == 0.25){
        self.graphics = [[ImageGraphics alloc] initWithImageName:@"rock1x4.png"];
    }
    else if(self.bounds.size.width / self.bounds.size.height == 0.5){
        self.graphics = [[ImageGraphics alloc] initWithImageName:@"rock1x2.png"];
    }
}

@end
