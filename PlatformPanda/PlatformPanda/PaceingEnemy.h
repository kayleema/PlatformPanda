//
//  PacingEnemy.h
//  PlatformPanda
//
//  Created by Keegan Mann on 5/3/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Enemy.h"

@interface PaceingEnemy : Enemy{
    float range;
    CGPoint home;
    float speed;
}

@property float range;
@property float speed;

@end
