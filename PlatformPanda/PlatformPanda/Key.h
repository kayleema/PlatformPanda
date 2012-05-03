//
//  Key.h
//  PlatformPanda
//
//  Created by Keegan Mann on 5/2/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "Element.h"
#import "Door.h"

@interface Key : Element{
    Door *door;
}

@property Door * door;

@end
