//
//  InputEventController.m
//  atvHelloWorld
//
//  Created by Michael Gile on 9/12/11.
//  Copyright 2011 Wayin Inc. All rights reserved.
//

#import "InputEventController.h"
#import "BREvent.h"

@implementation InputEventController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void) dealloc {
	[super dealloc];
}

- (BOOL) brEventAction:(BREvent*)event {
	
	NSLog(@"%s (%d): Remote action = %d", __PRETTY_FUNCTION__, __LINE__, [event remoteAction]);
	NSLog(@"%s (%d): Remote value = %d", __PRETTY_FUNCTION__, __LINE__, [event value]);
	NSLog(@"%s (%d): eventDictionary = %@", __PRETTY_FUNCTION__, __LINE__, [[event eventDictionary] description]);
	
	switch ([event remoteAction]) {
		case BREventMenuButtonAction:
			[[[self editor] textField] setString:@"Menu Button"];
			[[self stack] popController];
			break;
		case BREventOKButtonAction:
			[[[self editor] textField] setString:@"OK Button"];
			break;
		case BREventUpButtonAction:
			[[[self editor] textField] setString:@"Up Button"];
			break;
		case BREventDownButtonAction:
			[[[self editor] textField] setString:@"Down Button"];
			break;
		case BREventLeftButtonAction:
			[[[self editor] textField] setString:@"Left Button"];
			break;
		case BREventRightButtonAction:
			[[[self editor] textField] setString:@"Right Button"];
			break;
		case BREventPlayPauseButtonAction:
			[[[self editor] textField] setString:@"Play/Pause Button"];
			break;
		default:
			break;
	}
	
	[super brEventAction:event];
	return YES;
}

@end
