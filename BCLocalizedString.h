//  Created by Sam Deane on 26/02/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

/**

 A replacement for NSLocalizedString.
 
 We don't pass a second description parameter, instead we rely on the key always being something descriptive (and therefore the actual value of the string always being looked up, even for the english version).
 
 This is currently implemented very simply, but there's lots of scope for adding a debug implementation that can do clever things like adding "fake" translations, logging out details of missing keys, etc.
 
 */

extern NSString* BCLocalizedString(NSString* key);
