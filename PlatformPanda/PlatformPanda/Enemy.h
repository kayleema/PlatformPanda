//
//  Enemy.h
//  PlatformPanda
//
//  Created by Keegan Mann on 5/2/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Element.h"
#import "Projectile.h"

@interface Enemy : Projectile{
    float damage;
}

-(void) pushedBy:(Element*)elem inDirection:(int)direc;
-(void) setup;

@end
