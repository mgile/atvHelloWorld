//
//  HelloWorldMainMenu.m
//  atvHelloWorld
//
//  Created by Michael Gile on 9/11/11.
//  Copyright 2011 Michael Gile. All rights reserved.
//

#import "HelloWorldMainMenu.h"
#import "ApplianceConfig.h"
#import "GLGravityViewController.h"
#import "GLGravityView.h"
#import "BRImageManager.h"

@class BRWebView;

@implementation HelloWorldMainMenu

- (id)init {
    self = [super init];
    if (self) {
        // Initialization code here.
		[self setListTitle:APPLIANCE_MODULE_NAME];
		
		BRImage *sp = [[BRThemeInfo sharedTheme] previewActionImage];
		
		[self setListIcon:sp horizontalOffset:0.0 kerningFactor:0.15];
		
		_names = [[NSMutableArray alloc] init];
		[_names addObject:@"Schedule"];
		[_names addObject:@"Speakers"];
		[_names addObject:@"Hotel"];
		
		[[self list] setDatasource:self];
		
		return self;
    }
    
    return self;
}

-(void)dealloc {
	[_names release];
	[super dealloc];
}


- (id)previewControlForItem:(long)item {
	BRImage* previewImage = nil;
	
	switch (item) {
		case 0:
			previewImage = [BRImage imageWithPath:[[NSBundle bundleForClass:[HelloWorldMainMenu class]] pathForResource:@"360iDev" ofType:@"png"]];
			break;
		case 1:
			previewImage = [[BRThemeInfo sharedTheme] largeGeniusIconWithReflection];;
			break;
		case 2:
			previewImage = [BRImage imageWithPath:[[NSBundle bundleForClass:[HelloWorldMainMenu class]] pathForResource:@"CrownePlaza" ofType:@"png"]];
			break;
	}
	
	BRImageAndSyncingPreviewController *controller = [[BRImageAndSyncingPreviewController alloc] init];
	[controller setImage:previewImage];
	
	return controller;
}

- (void)itemSelected:(long)selected; {
	
	NSDictionary *currentObject = [_names objectAtIndex:selected];
	NSLog(@"%s (%d) item selected: %@", __PRETTY_FUNCTION__, __LINE__, currentObject);
	
	if (selected == 0) {
		// Schedule
		BRImage* schedImg	= [BRImage imageWithPath:[[NSBundle bundleForClass:[HelloWorldMainMenu class]] pathForResource:@"schedule" ofType:@"png"]];
		BRAsyncImageControl* asyncImageCtrl = [BRAsyncImageControl imageControlWithImage:schedImg];
		[asyncImageCtrl setUseLoadingSpinner:YES];
		[[self stack] pushController:[BRController controllerWithContentControl:asyncImageCtrl]];
	}
	else if (selected == 1) {
		// Speakers
		
	}
	else if (selected == 2) {
		// Hotel
	}
}

- (float)heightForRow:(long)row {
	return 0.0f;
}

- (long)itemCount {
	return [_names count];
}

- (id)itemForRow:(long)row {
	
	if(row > [_names count])
		return nil;
	
	BRMenuItem* menuItem	= [[BRMenuItem alloc] init];
	NSString* menuTitle		= [_names objectAtIndex:row];
	
	[menuItem setText:menuTitle withAttributes:[[BRThemeInfo sharedTheme] menuItemTextAttributes]];
	
	switch (row) {
			
		case 0:
			[menuItem addAccessoryOfType:1];
			break;
			
		case 1: 
			[menuItem addAccessoryOfType:1];
			break;
			
		default:
			[menuItem addAccessoryOfType:0];
			break;
	}
	
	return menuItem;
}

- (BOOL)rowSelectable:(long)selectable {
	return YES;
}

- (id)titleForRow:(long)row {
	return [_names objectAtIndex:row];
}

- (BOOL) brEventAction:(BREvent*)event {
	
	NSLog(@"%s (%d): Remote action = %d", __PRETTY_FUNCTION__, __LINE__, [event remoteAction]);
	NSLog(@"%s (%d): Remote value = %d", __PRETTY_FUNCTION__, __LINE__, [event value]);
	NSLog(@"%s (%d): eventDictionary = %@", __PRETTY_FUNCTION__, __LINE__, [[event eventDictionary] description]);
	
	switch ([event remoteAction]) {
		case BREventMenuButtonAction:
			[[self stack] popController];
			break;
		case BREventOKButtonAction:
		case BREventUpButtonAction:
		case BREventDownButtonAction:
		case BREventLeftButtonAction:
		case BREventRightButtonAction:
		case BREventPlayPauseButtonAction:
			/* fallthrough */
		default:
			[super brEventAction:event];
			break;
	}
	
	return YES;
}

@end
