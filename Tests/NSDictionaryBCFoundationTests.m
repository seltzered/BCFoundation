//
//  NSDictionaryBCFoundationTests.m
//  BCFoundation
//
//  Created by Johnnie Walker on 17/02/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.
//

#import <ECUnitTests/ECUnitTests.h>
#import "NSDictionary+BCFoundation.h"

@interface NSDictionaryBCFoundationTests : ECTestCase

@end

@implementation NSDictionaryBCFoundationTests

- (void)testCategories {
  NSString *string = @"Hi, how are you?";
  NSArray *array = @[@(1), @(2), @(3)];
  NSDictionary *dictionary = @{@(1): @{}};
  NSNumber *number = @(15);
  NSURL *url = [NSURL URLWithString:@"http://bohemiancoding.com"];
  
  NSDictionary *testDictionary = @{
                                   @"string": string,
                                   @"array": array,
                                   @"dictionary": dictionary,
                                   @"number": number,
                                   @"url": [url absoluteString]
                                   };
  
  for (NSDictionary *d in @[testDictionary, [testDictionary mutableCopy]]) {
    ECTestAssertNotNil([d stringForKey_BC:@"string"]);
    ECTestAssertIsEqual([d stringForKey_BC:@"string"], string);
    ECTestAssertNil([d stringForKey_BC:@"array"]);
    ECTestAssertNil([d stringForKey_BC:@"no_key"]);
    
    ECTestAssertNotNil([d arrayForKey_BC:@"array"]);
    ECTestAssertIsEqual([d arrayForKey_BC:@"array"], array);
    ECTestAssertNil([d arrayForKey_BC:@"no_key"]);
    ECTestAssertNil([d arrayForKey_BC:@"string"]);
    
    ECTestAssertNotNil([d dictionaryForKey_BC:@"dictionary"]);
    ECTestAssertIsEqual([d dictionaryForKey_BC:@"dictionary"], dictionary);
    ECTestAssertNil([d dictionaryForKey_BC:@"no_key"]);
    ECTestAssertNil([d dictionaryForKey_BC:@"string"]);
    
    ECTestAssertNotNil([d numberForKey_BC:@"number"]);
    ECTestAssertIsEqual([d numberForKey_BC:@"number"], number);
    ECTestAssertNil([d numberForKey_BC:@"no_key"]);
    ECTestAssertNil([d numberForKey_BC:@"string"]);
    
    ECTestAssertNotNil([d urlForKey_BC:@"url"]);
    ECTestAssertIsEqual([d urlForKey_BC:@"url"], url);
    ECTestAssertNil([d urlForKey_BC:@"no_key"]);
    ECTestAssertNil([d urlForKey_BC:@"string"]);
  }
}

@end
