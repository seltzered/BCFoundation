//
//  NSDictionary+BCFoundation.h
//  BCFoundation
//
//  Created by Johnnie Walker on 17/02/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (BCFoundation)
/// Returns a string for `aKey`, or nil if the receiver has no value for `aKey`, or that object value is not a string
- (NSString *)stringForKey_BC:(id)aKey;

/// Returns an array for `aKey`, or nil if the receiver has no value for `aKey`, or that object value is not an array
- (NSArray *)arrayForKey_BC:(id)aKey;

/// Returns a dictionary for `aKey`, or nil if the receiver has no value for `aKey`, or that object value is not a dictionary
- (NSDictionary *)dictionaryForKey_BC:(id)aKey;

/// Returns a number for `aKey`, or nil if the receiver has no value for `aKey`, or that object value is not a number
- (NSNumber *)numberForKey_BC:(id)aKey;

/// Returns a boolean for `aKey` by calling `boolValue on ``numberForKey_BC`
- (BOOL)boolForKey_BC:(id)aKey;

/// Returns a URL for `aKey`, or nil if the receiver has no value for `aKey`, or that object value cannot be made into an URL
- (NSURL *)urlForKey_BC:(id)key;
@end
