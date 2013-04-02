//
//  ManifestStore.m
//  TheRuckus
//
//  Created by Warren Smith on 2013-04-01.
//
//  Responsible for creating Manifest objects and passing them back to ViewControllers.
//  Provides creation and fetch methods.

#import "ManifestStore.h"

@implementation ManifestStore

static ManifestStore *defaultStore = nil;

// Creates a singleton instance of ManifestStore
+ (ManifestStore *)defaultStore
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

// Protect singleton status
- (id)init
{
    if (defaultStore) {
        return defaultStore;
    }
    
    self = [super init];
    return self;
}

@end
