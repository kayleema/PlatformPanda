//
//  Level.m
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Level.h"
#import "Element.h"
#import "Projectile.h"
#import "Protag.h"

@implementation Level

@synthesize elements;
@synthesize protag;
@synthesize finished;
@synthesize dead;

- (id)init{
    self = [super init];
    if (self){
        elements = [[NSMutableArray alloc] init];
        [self loadElements];
        gravity = 500.0;
    }
    return self;
}

- (void) loadElements{
    
}

- (void) simulateWithTimeInterval:(float)tmInt{
    for(Element * elem in self.elements){
        if([elem respondsToSelector:@selector(simulateWithTimeInterval:)]){
            [(id)elem simulateWithTimeInterval:tmInt];
        }
        if([elem isKindOfClass:[Projectile class]]){
            ((Projectile *)elem).vy += gravity * tmInt;
        }
    }
    [self calculateCollisions];
    
    //check protag offscreen
    if (protag.bounds.origin.y > 5000){
        self.finished = self.dead = YES;
    }
}

- (void) calculateCollisions{
    for (int i = 0; i < elements.count; i++) {
        for (int j = i+1; j < elements.count; j++) {
            Element *e1 = [elements objectAtIndex:i];
            Element *e2 = [elements objectAtIndex:j];
            if ( [e1 intersectsWith:e2] ){
                if (e1.moveOutLevel > e2.moveOutLevel) {
                    Element *temp = e1;
                    e1 = e2;
                    e2 = temp;
                }
                int dir = [e1 push:e2];
                if ([e2 respondsToSelector:@selector(pushedBy:inDirection:)]) {
                    [(id)e2 pushedBy:e1 inDirection:dir];
                }
                if ([e1 respondsToSelector:@selector(pushedBy:inDirection:)]) {
                    [(id)e1 pushedBy:e2 inDirection:(dir+2)%4];
                }
            }
        }
    }
}

-(void) addElement:(Element *)elem{
    [self.elements addObject:elem];
    elem.mylevel = self;
}

-(void) reachedGoal{
    self.finished = YES;
    self.dead = NO;
}

@end
