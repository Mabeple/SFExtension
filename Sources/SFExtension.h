//
//  SFExtension.h
//  SFExtension
//
//  Created by cy on 2018/10/13.
//  Copyright © 2018 cmapu. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#elif TARGET_OS_MAC
#import <Cocoa/Cocoa.h>
#endif


//! Project version number for SFExtension.
FOUNDATION_EXPORT double SFExtensionVersionNumber;

//! Project version string for SFExtension.
FOUNDATION_EXPORT const unsigned char SFExtensionVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SFExtension/PublicHeader.h>
