//
//  Door.m
//  PlatformPanda
//
//  Created by Keegan Mann on 5/2/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Door.h"
#import "ImageSetGraphics.h"

@implementation Door

-(int) moveOutLevel{
    return 1;
}

-(int) push:(Element *)other{
    if( !self.open ){
        return [super push:other];
    }
    else {
        return 0;
    }
}

-(void) setupGraphics{
    self.graphics = [[ImageSetGraphics alloc] initWithImageNames:@"doorclosed.png", @"dooropen.png", nil];
    ((ImageSetGraphics*)self.graphics).currentIndex = 0;
}

-(void)setOpen:(BOOL)newopen{
    open = newopen;
    NSLog(@"OPEN %i", open);
    if(!self.open){
        ((ImageSetGraphics*)self.graphics).currentIndex = 0;
    }
    else{
        ((ImageSetGraphics*)self.graphics).currentIndex = 1;
    }
}
-(BOOL)open{
    return open;
}

@end
