//
//  VersionComparisonTests.m
//  BCFoundation
//
//  Created by Johnnie Walker on 17/02/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.
//

#import <ECUnitTests/ECUnitTests.h>
#import "BCVersionComparison.h"

@interface VersionComparisonTests : ECTestCase

@end

@implementation VersionComparisonTests

- (void)testCompareVersions {
  NSString *version1 = @"1";
  NSString *version2 = @"1.0";
  NSString *version3 = @"1.0.1";
  NSString *version4 = @"1.1.0";
  NSString *version5 = @"2.0";

  ECTestAssertTrue(BCCompareVersions(version1, version2) == NSOrderedSame);
  ECTestAssertTrue(BCCompareVersions(version1, version3) == NSOrderedAscending);
  ECTestAssertTrue(BCCompareVersions(version1, version4) == NSOrderedAscending);
  ECTestAssertTrue(BCCompareVersions(version1, version5) == NSOrderedAscending);
}

@end
