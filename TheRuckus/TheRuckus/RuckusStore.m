//
//  RuckusStore.m
//  TheRuckus
//
//  Created by Gagandeep Dulay on 2013-03-30.
//
//

#import "RuckusStore.h"

@implementation RuckusStore

static RuckusStore *defaultStore = nil;

// Creates a singleton instance of RuckusStore, provides access to model and context
+ (RuckusStore *)defaultStore
{
    if (defaultStore) {
        defaultStore = [[super allocWithZone:NULL] init];
    }
    return defaultStore;
}

// Prevent creation of additional instances
+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

// Protect's singleton status
- (id)init
{
    if (defaultStore) {
        return defaultStore;
    }
    
    self = [super init];
    return self;
}




@end
