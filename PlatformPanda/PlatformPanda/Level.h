//
//  Level.h
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protag.h"

@interface Level : NSObject{
    NSMutableArray *elements;
    float gravity;
    Protag *protag;
    BOOL finished;
    BOOL dead;
}

@property NSMutableArray* elements;
@property (retain) Protag* protag;
@property BOOL finished;
@property BOOL dead;

- (id) init;
- (void) loadElements;
- (void) simulateWithTimeInterval:(float)tmInt;
- (void) calculateCollisions;

-(void) addElement:(Element *) elem;

-(void) reachedGoal;
-(void) die;

@end
