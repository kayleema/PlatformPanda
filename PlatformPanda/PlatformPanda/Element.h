//
//  Element.h
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DIR_RIGHT 0
#define DIR_UP    1
#define DIR_LEFT  2
#define DIR_DOWN  3

@class Graphics;

@interface Element : NSObject{
    CGRect bounds;
    Graphics *graphics;
}

@property Graphics *graphics;
@property CGRect bounds;

-(id) initWithBounds:(CGRect)newbounds;

-(id) initWithBounds:(CGRect)newbounds AndGraphics:(Graphics *)newgraphics;

-(BOOL) intersectsWith:(Element *)other;

-(int) push:(Element *)other;

-(int) moveOutLevel;

@end
