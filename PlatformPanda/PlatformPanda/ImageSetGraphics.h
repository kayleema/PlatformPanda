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
    int currentIndex;
}

@property NSMutableArray *images;
@property int currentIndex;


-(id) initWithImageNames: (NSString *)firstImage, ...;

-(UIImage *) currentImage;

@end
