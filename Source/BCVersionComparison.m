//
//  BCVersionComparison.m
//  BCFoundation
//
//  Created by Johnnie Walker on 17/02/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.
//

#import "BCVersionComparison.h"

NSComparisonResult BCCompareVersions(NSString* version1, NSString* version2)
{
  NSArray* components1 = [[version1 stringByAppendingString:@".0.0.0"] componentsSeparatedByString:@"."];
  NSArray* components2 = [[version2 stringByAppendingString:@".0.0.0"] componentsSeparatedByString:@"."];
  for (NSUInteger n = 0; n < 3; ++n) {
    NSInteger value1 = [components1[n] integerValue];
    NSInteger value2 = [components2[n] integerValue];
    if (value1 < value2)
      return NSOrderedAscending;
    else if (value2 < value1)
      return NSOrderedDescending;
  }
  
  return NSOrderedSame;
}