//
//  BRTopShelfView-ProductImage.m
//  atvHelloWorld
//
//  Created by Michael Gile on 8/21/11.
//  Copyright 2011 Michael Gile. All rights reserved.
//

#import "BRTopShelfView-ProductImage.h"
#import "BackRowExtras.h"
#import "BackRow.h"

@implementation BRTopShelfView (ProductImage)

- (BRImageControl *) productImage {
	return MSHookIvar<BRImageControl *>(self, "_productImage");
}

@end
