//
//  Element.m
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Element.h"
#import "Graphics.h"
#import "BoxGraphics.h"

@implementation Element

@synthesize bounds;
@synthesize graphics;

-(int) moveOutLevel{
    return 1;
}

-(id) initWithBounds:(CGRect)newbounds{
    self = [super init];
    if(self){
        bounds = newbounds;
        graphics = [[BoxGraphics alloc] initWithColor:[UIColor greenColor]];
    }
    return self;
}

-(id) initWithBounds:(CGRect)newbounds AndGraphics:(Graphics *)newgraphics{
    self = [super init];
    if(self){
        bounds = newbounds;
        graphics = newgraphics;
    }
    return self;
}

-(BOOL) intersectsWith:(Element *)other{
    return CGRectIntersectsRect(self.bounds, other.bounds);
}


-(int) push:(Element *)other{
    float right = CGRectGetMaxX(self.bounds )-CGRectGetMinX(other.bounds);
    float left  = CGRectGetMaxX(other.bounds)-CGRectGetMinX(self.bounds );
    float up    = CGRectGetMaxY(other.bounds)-CGRectGetMinY(self.bounds );
    float down  = CGRectGetMaxY(self.bounds )-CGRectGetMinY(other.bounds);
    float minoverlap = MIN(MIN(right, left), MIN(up, down));
    if(minoverlap == right){
        other.bounds = CGRectOffset(other.bounds, right, 0);
        return DIR_RIGHT;
    }
    else if(minoverlap == left){
        other.bounds = CGRectOffset(other.bounds, -left, 0);
        return DIR_LEFT;
    }
    else if(minoverlap == up){
        other.bounds = CGRectOffset(other.bounds, 0, -up);
        return DIR_UP;
    }
    else if(minoverlap == down){
        other.bounds = CGRectOffset(other.bounds, 0, down);
        return DIR_DOWN;
    }
    return -1;
}

@end
