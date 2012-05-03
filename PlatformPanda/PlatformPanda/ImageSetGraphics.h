//
//  ImageSetGraphics.h
//  PlatformPanda
//
//  Created by Keegan Mann on 5/1/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Graphics.h"

@interface ImageSetGraphics : Graphics{
    NSMutableArray *images;
    NSMutableArray *imagesflipped;
    int currentIndex;
    BOOL flipped;
}

@property NSMutableArray *images;
@property int currentIndex;
@property BOOL flipped;


-(id) initWithImageNames: (NSString *)firstImage, ...;

-(UIImage *) currentImage;

@end
