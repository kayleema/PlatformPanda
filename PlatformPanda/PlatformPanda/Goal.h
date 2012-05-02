//
//  Goal.h
//  PlatformPanda
//
//  Created by Keegan Mann on 5/1/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Terrain.h"

@interface Goal : Terrain

-(void) pushedBy:(Element*)elem inDirection:(int)direc;

@end
