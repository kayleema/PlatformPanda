//
//  ImageGraphics.m
//  PlatformPanda
//
//  Created by Keegan Mann on 5/1/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "ImageGraphics.h"

@implementation ImageGraphics
@synthesize image;


- (id) initWithImageName:(NSString *)name{
    self = [super init];
    if (self) {
        self.image = [UIImage imageNamed:name];
    }
    return self;
}

@end
