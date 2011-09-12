//
//  TopShelfController.h
//  atvHelloWorld
//
//  Created by Michael Gile on 8/21/11.
//  Copyright 2011 Michael Gile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopShelfController : NSObject {
	
}

- (void) refresh;

- (void) selectCategoryWithIdentifier:(id)identifier;

- (id) topShelfView;

@end
