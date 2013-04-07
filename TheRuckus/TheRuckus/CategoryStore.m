//
//  CategoryStore.m
//  TheRuckus
//
//  Created by Warren Smith on 2013-04-01.
//
//

#import "CategoryStore.h"

static CategoryStore *defaultStore = nil;

@implementation CategoryStore

// Create a singleton instances of CategoryStore
+ (CategoryStore *)defaultStore
{
    if (!defaultStore){
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
    
    context = [[RuckusStore defaultStore] getContext];
    model = [[RuckusStore defaultStore] getModel];
    
    return self;
}

-(Category *)createCategory {
    Category *c = [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:context];
    return c;
}

-(NSArray *)fetchAllCategories
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *e = [[model entitiesByName] objectForKey:@"Category"];
    [request setEntity:e];
    
    NSError *error;
    NSArray *result = [context executeFetchRequest:request error:&error];
    if (result) {
        [NSException raise:@"Category fetch failed" format:@"Reason: %@", [error localizedDescription]];
    }
    
    return [[NSMutableArray alloc] initWithArray:result];
}

-(BOOL)saveChanges
{
    return [[RuckusStore defaultStore] saveChanges];
}

@end
