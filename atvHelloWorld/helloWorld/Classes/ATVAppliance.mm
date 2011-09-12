//
//  ATVAppliance.mm
//  atvHelloWorld
//
//  Created by Michael Gile on 8/21/11.
//  Copyright 2011 Michael Gile. All rights reserved.
//

#import "ATVAppliance.h"
#import "ApplianceConfig.h"
#import "TopShelfController.h"
#import "GLGravityView.h"
#import "GLGravityViewController.h"
#import "HelloWorldMainMenu.h"

@implementation ATVAppliance

@synthesize topShelfController = _topShelfController;

+ (NSArray*) applianceCategories {
	
	NSMutableArray* categoryList = [[NSMutableArray alloc] initWithCapacity:5];
	
	[categoryList addObject:[BRApplianceCategory categoryWithName:HW_CATEGORY_NAME 
													   identifier:HW_ID 
												   preferredOrder:HW_PREFERRED_ORDER]];
	
	[categoryList addObject:[BRApplianceCategory categoryWithName:T60_CATEGORY_NAME 
													   identifier:T60_ID 
												   preferredOrder:T60_PREFERRED_ORDER]];
	
	[categoryList addObject:[BRApplianceCategory categoryWithName:VIDEO_CATEGORY_NAME 
													   identifier:VIDEO_ID 
												   preferredOrder:VIDEO_PREFERRED_ORDER]];
	
	[categoryList addObject:[BRApplianceCategory categoryWithName:TEAPOT_CATEGORY_NAME 
													   identifier:TEAPOT_ID 
												   preferredOrder:TEAPOT_PREFERRED_ORDER]];
	
	[categoryList addObject:[BRApplianceCategory categoryWithName:MOLECULES_CATEGORY_NAME 
													   identifier:MOLECULES_ID 
												   preferredOrder:MOLECULES_PREFERRED_ORDER]];
	
	
	return [NSArray arrayWithArray:[categoryList autorelease]];
}


+ (void) initialize {
	;
}

- (id)init {
    self = [super init];
    if (self) {
		_topShelfController		= [[TopShelfController alloc] init];
		_applianceCategories	= [[ATVAppliance applianceCategories] retain];
    }
    
    return self;
}

- (void) dealloc {
	[_applianceCategories release];
	[_topShelfController release];
	[super dealloc];
}

- (id) applianceCategories {
	return _applianceCategories;
}

- (id) identifierForContentAlias:(id)contentAlias {
	return APPLIANCE_MODULE_NAME;
}

- (id) selectCategoryWithIdentifier:(id)ident {
	NSLog(@"[DEBUG] %s (%d): ident = %@", __PRETTY_FUNCTION__, __LINE__, [ident description]);
	return nil;
}

- (BOOL) handleObjectSelection:(id)fp8 userInfo:(id)fp12 {
	NSLog(@"[ENTRY] %s (%d)", __PRETTY_FUNCTION__, __LINE__);
	return YES;
}

- (id) applianceSpecificControllerForIdentifier:(id)arg1 args:(id)arg2 {
	//NSLog(@"applianceSpecificControllerForIdentifier: %@ args: %@", arg1, arg2);
	return nil;
}

- (id) controllerForIdentifier:(id)identifier args:(id)args
{
	id controller	= nil;
	
	if ([identifier isEqualToString:HW_ID]) {
		controller 	= [BRAlertController alertOfType:0 
											  titled:@"BRAlertController" 
										 primaryText:@"Hello World" 
									   secondaryText:@"Goodbye World"];
	}
	else if ([identifier isEqualToString:T60_ID]) {
		controller	= [[HelloWorldMainMenu alloc] init];
	}
	else if ([identifier isEqualToString:VIDEO_ID]) {
		controller	= [[HelloWorldMainMenu alloc] init];
	}
	else if ([identifier isEqualToString:TEAPOT_ID]) {
		GLGravityView* gravityView = [[GLGravityView alloc] init];
		[gravityView startAnimation];
		
		controller = [BRController controllerWithContentControl:gravityView];
		[gravityView release];
	}
	else if ([identifier isEqualToString:MOLECULES_ID]) {
		GLGravityView* gravityView = [[GLGravityView alloc] init];
		[gravityView startAnimation];
		
		controller = [BRController controllerWithContentControl:gravityView];
		[gravityView release];
	}
	
	return controller;
}

- (id) localizedSearchTitle { 
	return APPLIANCE_LOCALIZED_NAME; 
}

- (id) applianceName { 
	return APPLIANCE_NAME; 
}

- (id) moduleName { 
	return APPLIANCE_MODULE_NAME; 
}

- (id) applianceKey { 
	return APPLIANCE_KEY; 
}

@end
