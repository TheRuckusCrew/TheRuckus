//
//  UserStore.m
//  TheRuckus
//
//  Created by Warren Smith on 2013-04-01.
//
//  Responsible for creating User objects and passing them back to ViewControllers.
//  Provides creation and fetch methods.

#import "UserStore.h"

@implementation UserStore

static UserStore *defaultStore = nil;

// Create a singleton instance of UserStore
+ (UserStore *)defaultStore
{
    if (!defaultStore) {
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
- (id) init
{
    if (defaultStore) {
        return defaultStore;
    }
    
    self = [super init];
    
    model = [[RuckusStore defaultStore] getModel];
    context = [[RuckusStore defaultStore] getContext];
    
    return self;
}

-(User *)createUser {
    User *u = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    return u;
}

-(NSArray *)fetchAllUsers
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *e = [[model entitiesByName] objectForKey:@"User"];
    [request setEntity:e];
    
    NSError *error;
    NSArray *result = [context executeFetchRequest:request error:&error];
    if (result) {
        [NSException raise:@"User fetch failed" format:@"Reason: %@", [error localizedDescription]];
    }
    
    return [[NSMutableArray alloc] initWithArray:result];
}

-(BOOL)saveChanges
{
    return [[RuckusStore defaultStore] saveChanges];
}

@end
