//
//  NSDictionaryBCFoundationTests.m
//  BCFoundation
//
//  Created by Johnnie Walker on 17/02/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.
//

#import <ECUnitTests/ECUnitTests.h>
#import "BCLocalizedString.h"

@interface BCLocalizedTests : ECTestCase

@end

@implementation BCLocalizedTests

- (void)testBasics {
  NSString* test = BCLocalizedString(@"test.key");
  ECTestAssertStringIsEqual(test, @"value");
}

- (void)testOtherTable {
  NSString* test = BCLocalizedStringFromTable(@"test.key", @"MoreLocalizable");
  ECTestAssertStringIsEqual(test, @"another value");
}

- (void)testMissing {
  NSString* test = BCLocalizedString(@"missing");
  ECTestAssertStringIsEqual(test, @"missing");
}
@end
