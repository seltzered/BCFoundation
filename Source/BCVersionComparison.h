//
//  BCVersionComparison.h
//  BCFoundation
//
//  Created by Johnnie Walker on 17/02/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.
//

#import <Foundation/Foundation.h>

/// Compares two strings representing application version numbers, for example: @"1", @"1.0", @"1.1.2"
NSComparisonResult BCCompareVersions(NSString* version1, NSString* version2);
