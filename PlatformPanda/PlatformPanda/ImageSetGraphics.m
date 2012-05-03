//
//  ImageSetGraphics.m
//  PlatformPanda
//
//  Created by Keegan Mann on 5/1/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "ImageSetGraphics.h"

@implementation ImageSetGraphics

@synthesize images;
@synthesize currentIndex;
@synthesize flipped;

-(id) initWithImageNames: (NSString *)firstImage, ...{
    self = [super init];
    if(self){
        images = [[NSMutableArray alloc] init];
        imagesflipped = [[NSMutableArray alloc] init];
        va_list args;
        va_start(args, firstImage);
        
        NSString *imagename = firstImage;
        do {
            UIImage * img = [UIImage imageNamed:imagename];
            [images addObject:img];
            UIImage * newimage = [UIImage imageWithCGImage:img.CGImage scale:1.0 orientation:UIImageOrientationUpMirrored];
            [imagesflipped addObject:newimage];
        } while ( (imagename = va_arg(args, NSString *)) != nil ) ;
        
        va_end(args);
    }
    return self;
}

-(UIImage *)currentImage{
    if(flipped){
        return (UIImage *)[imagesflipped objectAtIndex:currentIndex];
    }
    else {
        return (UIImage *)[images objectAtIndex:currentIndex];
    }
}

@end
