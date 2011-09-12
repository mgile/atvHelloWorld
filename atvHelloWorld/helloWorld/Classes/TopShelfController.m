//
//  TopShelfController.m
//  atvHelloWorld
//
//  Created by Michael Gile on 8/21/11.
//  Copyright 2011 Michael Gile. All rights reserved.
//

#import "TopShelfController.h"
#import "BackRow.h"
#import "BRTopShelfView-ProductImage.h"

@implementation TopShelfController

- (id)init {
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)refresh {
	//needed for 4.2.1 compat to keep AppleTV.app from endless reboot cycle
}

- (void)selectCategoryWithIdentifier:(id)identifier {
	//leave this entirely empty for controllerForIdentifier:args to work in Appliance subclass
}


- (BRTopShelfView *)topShelfView { 	
	BRTopShelfView* topShelf		= [[BRTopShelfView alloc] init];
	BRImageControl* imageControl	= [topShelf productImage];
	BRImage* theImage				= [BRImage imageWithPath:[[NSBundle bundleForClass:[TopShelfController class]] pathForResource:@"360iDevBanner" ofType:@"png"]];
	//BRImage *theImage = [[BRThemeInfo sharedTheme] appleTVIconOOB];
	[imageControl setImage:theImage];
	
	return topShelf;
}

@end
