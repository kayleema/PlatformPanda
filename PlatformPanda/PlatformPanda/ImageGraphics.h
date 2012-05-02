//
//  ImageGraphics.h
//  PlatformPanda
//
//  Created by Keegan Mann on 5/1/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Graphics.h"

@interface ImageGraphics : Graphics{
    UIImage *image;
}

@property UIImage *image;

- (id) initWithImageName:(NSString *)name;

@end
