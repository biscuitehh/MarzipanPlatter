//
//  UIKit.h
//  UIKit
//
//  Copyright © 2017 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#undef NS_CLASS_AVAILABLE_IOS
#undef __API_AVAILABLE
#undef NS_AVAILABLE_IOS
#undef NS_ENUM_AVAILABLE_IOS
#undef API_DEPRECATED

#define NS_AVAILABLE_IOS(...)
#define NS_ENUM_AVAILABLE_IOS(...)
#define NS_CLASS_AVAILABLE_IOS(_ios)
#define __API_AVAILABLE(...)
#define API_DEPRECATED(...)

FOUNDATION_EXPORT double UIKitVersionNumber;
FOUNDATION_EXPORT const unsigned char UIKitVersionString[];

#import <UIKit/UIKitCore.h>

#if __has_include(<UIKit/DocumentManager.h>)
#import <UIKit/DocumentManager.h>
#endif
