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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (Element *elem in viewController.elementList){
        if ([elem.graphics isKindOfClass:[BoxGraphics class]]) {
            CGRect drawRect = CGRectOffset(elem.bounds, 
                                           -screenPosition.x+self.bounds.size.width/2.0, 
                                           -screenPosition.y+self.bounds.size.height/2.0);
            BoxGraphics *g = (BoxGraphics *)(elem.graphics);
            [g.color setFill];
            [[UIColor blackColor] setStroke];
            CGContextAddRect(context, drawRect);
            CGContextFillPath(context);
            CGContextAddRect(context, drawRect);
            CGContextStrokePath(context);
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
