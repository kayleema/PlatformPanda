//
//  Projectile.h
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Element.h"

@interface Projectile : Element{
    float vx, vy;
}

@property float vx;
@property float vy;

-(id) init;

-(void) simulateWithTimeInterval:(float)tmInt;

@end
