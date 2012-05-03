//
//  Projectile.m
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Projectile.h"

@implementation Projectile

@synthesize vx;
@synthesize vy;

-(void) simulateWithTimeInterval:(float)tmInt{
    self.bounds = CGRectMake(self.bounds.origin.x + vx*tmInt, 
                             self.bounds.origin.y + vy*tmInt, 
                             self.bounds.size.width, 
                             self.bounds.size.height);
}

-(int) moveOutLevel{
    return 2;
}

@end
