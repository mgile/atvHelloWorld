//
//  GLGravityViewController.h
//  atvHelloWorld
//
//  Created by Michael Gile on 9/11/11.
//  Copyright 2011 Michael Gile. All rights reserved.
//

#import "BRController.h"

@class GLGravityView;

@interface GLGravityViewController : BRController {
	GLGravityView*		_gravityView;
}

@property (nonatomic, retain) GLGravityView* gravityView;

@end
