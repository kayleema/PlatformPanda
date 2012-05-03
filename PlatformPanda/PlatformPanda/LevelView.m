//
//  LevelView.m
//  PlatformPanda
//
//  Created by Keegan Mann on 4/29/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "LevelView.h"
#import "Element.h"
#import "Graphics.h"
#import "BoxGraphics.h"
#import "ImageGraphics.h"
#import "ImageSetGraphics.h"

@implementation LevelView

@synthesize viewController;
@synthesize screenStiffness;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    switch (viewController.state) {
        case STATE_WON:
            [[UIImage imageNamed:@"won-land.png"] drawInRect:self.bounds];
            break;
        case STATE_DEAD:
            [[UIImage imageNamed:@"dead-land.png"] drawInRect:self.bounds];
            break;
        case STATE_MAIN_MENU:
            [[UIImage imageNamed:@"start-land.png"] drawInRect:self.bounds];
            break;
        default:
            [self drawLevel];
            break;
    }
}

-(void) drawLevel{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (Element *elem in viewController.elementList){
        CGRect drawRect = CGRectOffset(elem.bounds, 
                                       -screenPosition.x+self.bounds.size.width/2.0, 
                                       -screenPosition.y+self.bounds.size.height/2.0);
        if ([elem.graphics isKindOfClass:[BoxGraphics class]]) {
            BoxGraphics *g = (BoxGraphics *)(elem.graphics);
            [g.color setFill];
            [[UIColor blackColor] setStroke];
            CGContextAddRect(context, drawRect);
            CGContextFillPath(context);
            CGContextAddRect(context, drawRect);
            CGContextStrokePath(context);
        }
        else if ([elem.graphics isKindOfClass:[ImageGraphics class]]) {
            ImageGraphics *g = (ImageGraphics *)(elem.graphics);
            [g.image drawInRect:drawRect];
        }
        else if ([elem.graphics isKindOfClass:[ImageSetGraphics class]]) {
            ImageSetGraphics *g = (ImageSetGraphics *)(elem.graphics);
            [g.currentImage drawInRect:drawRect];
        }
    }
    [self setNeedsDisplay];
}

- (void) slideScreen:(CGPoint)target forTime:(float)tmInt{
    screenPosition = CGPointMake(screenPosition.x + tmInt*screenStiffness*(target.x-screenPosition.x), 
                                 screenPosition.y + tmInt*screenStiffness*(target.y-screenPosition.y));
}

-(BOOL) isMultipleTouchEnabled{
    return YES;
}

@end
