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
@class Level;

@interface Element : NSObject{
    CGRect bounds;
    Graphics *graphics;
    Level *mylevel;
}

@property (retain) Graphics *graphics;
@property CGRect bounds;
@property Level *mylevel;

-(id) initWithBounds:(CGRect)newbounds;

-(BOOL) intersectsWith:(Element *)other;

-(int) push:(Element *)other;

-(int) moveOutLevel;

-(void) setupGraphics;

@end
