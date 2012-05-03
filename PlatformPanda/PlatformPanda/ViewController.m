//
//  ViewController.m
//  PlatformPanda
//
//  Created by Keegan Mann on 4/27/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "ViewController.h"
#import "TestLevel1.h"
#import "Element.h"
#import "LevelView.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface ViewController (){
    //NSTimer * mytimer;
    CADisplayLink *displayLink;
    int touchesleft, touchescenter, touchesright;
    int menutouches;
}

@end

@implementation ViewController

@synthesize touchControl;
@synthesize state;

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

-(void) loadLevel{
    level = [[TestLevel1 alloc] init];
    
    ((LevelView*)self.view).screenStiffness = 2.0;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [((LevelView*)self.view) loadResources];
    self.state = STATE_MAIN_MENU;
    [self.view setNeedsDisplay];
}

//MENUS

- (void) touchAtX:(float)x andY:(float)y{
    switch (self.state) {
        case STATE_MAIN_MENU:
                [self loadLevel];
                [self startGame];
            break;
        case STATE_DEAD:
        case STATE_WON:
            menutouches++;
            if(menutouches >=2){
                menutouches = 0;
                [self stopGame:STATE_MAIN_MENU];
            }
            break;
        default:
            break;
    }
}

- (void) startGame{
    self.state = STATE_RUN;
    
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(doFrame)];
    displayLink.frameInterval = 2;
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void) stopGame:(int)newstate{
    [displayLink invalidate];
    
    self.state = newstate;
    [self.view setNeedsDisplay];
}

- (NSArray*)elementList{
    return level.elements;
}

- (void)doFrame{
    float tmInt = displayLink.duration * displayLink.frameInterval;
    [((LevelView *)self.view) slideScreen: CGPointMake(CGRectGetMidX(level.protag.bounds), 
                                                       CGRectGetMidY(level.protag.bounds)) 
                                  forTime:tmInt];
    [level simulateWithTimeInterval:tmInt];
    [self.view setNeedsDisplay];
    
    if (level.finished) {
        if (level.dead) {
            [self stopGame:STATE_DEAD];
        }
        else {
            [self stopGame:STATE_WON];
        }
    }
}

- (void)touchIncrement:(UITouch *)touch{
    CGPoint p = [touch locationInView:self.view];
    if ( p.x < 100 ) {
        touchesleft++;
    }
    else if ( (self.view.bounds.size.width - p.x) < 100 ) {
        touchesright++;
    }
    else {
        touchescenter++;
    }
}

- (void)touchDecrementPrev:(UITouch *)touch{
    CGPoint p = [touch previousLocationInView:self.view];
    if ( p.x < 100 ) {
        touchesleft--;
    }
    else if ( (self.view.bounds.size.width - p.x) < 100 ) {
        touchesright--;
    }   
    else {
        touchescenter--;
    }
}
- (void)touchDecrementNow:(UITouch *)touch{
    CGPoint p = [touch locationInView:self.view];
    if ( p.x < 100 ) {
        touchesleft--;
    }
    else if ( (self.view.bounds.size.width - p.x) < 100 ) {
        touchesright--;
    }   
    else {
        touchescenter--;
    }
}

-(void) processTouches{
    level.protag.left  = touchesleft   > 0;
    level.protag.right = touchesright  > 0;
    level.protag.up    = touchescenter > 0;
    if (touchesleft < 0 || touchescenter < 0 || touchesright < 0) {
        touchesleft = MAX(touchesleft, 0);
        touchescenter = MAX(touchescenter, 0);
        touchesright = MAX(touchesright, 0);
    }
}

- (void) startMenu{
    UIButton *startbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startbutton.bounds = CGRectMake(30, 200, self.view.bounds.size.width - 60, 50);
    
    [self.view addSubview:startbutton];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches){
        [self touchIncrement:touch];
    }
    [self processTouches];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches){
        [self touchIncrement:touch];
        [self touchDecrementPrev:touch];
    }
    [self processTouches];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches){
        [self touchDecrementNow:touch];
    }
    [self processTouches];
    [self touchAtX:[[touches anyObject] locationInView:self.view].x
              andY:[[touches anyObject] locationInView:self.view].y];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches){
        [self touchDecrementNow:touch];
    }
    [self processTouches];
}

-(float) getHealth{
    return level.protag.health;
}

@end
