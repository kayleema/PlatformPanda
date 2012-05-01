//
//  BoxGraphics.h
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Graphics.h"

@interface BoxGraphics : Graphics{
    UIColor *color;
}

@property UIColor *color;

-(id) initWithColor:(UIColor*) newcolor;

@end
