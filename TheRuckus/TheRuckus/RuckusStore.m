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
        [defaultStore initDatabase];
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

- (NSManagedObjectContext *) getContext
{
    return context;
}

- (NSManagedObjectModel *) getModel
{
    return model;
}

- (void)initDatabase
{
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
    //    NSLog(@"model = %@", model);
    
    NSPersistentStoreCoordinator *psc =
    [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* basePath = [paths objectAtIndex:0];
    NSURL* storeUrl = [NSURL fileURLWithPath:[basePath stringByAppendingPathComponent: @"RuckusDatabase.sqlite"]];
    //    NSLog(@"storeUrl = %@", [storeUrl description]);
    
    NSError *error = nil;

    if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                           configuration:nil
                                     URL:storeUrl
                                 options:nil
                                   error:&error]) {
        [NSException raise:@"Open failed"
                    format:@"Reason: %@", [error localizedDescription]];
    }
    
    context = [[NSManagedObjectContext alloc] init];
    [context setPersistentStoreCoordinator:psc];
    [context setUndoManager:nil];
}





@end
