//
//  GLGravityViewController.m
//  atvHelloWorld
//
//  Created by Michael Gile on 9/11/11.
//  Copyright 2011 Michael Gile. All rights reserved.
//

#import "GLGravityViewController.h"
#import "GLGravityView.h"

@implementation GLGravityViewController

@synthesize gravityView = _gravityView;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void) dealloc {
	[_gravityView release];
	[super dealloc];
}

- (void)wasBuried {
	[super wasBuried];
}

- (void)wasExhumed {
	
}

- (void)wasPopped {
	[super wasPopped];
	[_gravityView stopAnimation];
}


- (void)wasPushed {
	[super wasPushed];
}

@end
