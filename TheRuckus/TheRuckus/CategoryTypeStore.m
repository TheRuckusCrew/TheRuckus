//
//  CategoryTypeStore.m
//  TheRuckus
//
//  Created by Warren Smith on 2013-04-01.
//
//

#import "CategoryTypeStore.h"

@implementation CategoryTypeStore

static CategoryTypeStore *defaultStore = nil;

// Creates a singleton instance of ManifestStore
+(CategoryTypeStore *)defaultStore
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
- (id)init
{
    if (defaultStore) {
        return defaultStore;
    }
    
    self = [super init];
    
    model = [[RuckusStore defaultStore] getModel];
    context = [[RuckusStore defaultStore] getContext];
    
    return self;
}

-(CategoryType *)createCategoryType
{
    CategoryType *ma = [NSEntityDescription insertNewObjectForEntityForName:@"CategoryType"
                                                      inManagedObjectContext:context];
    return ma;
}

-(NSArray *)fetchAllCategoryTypes
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *e = [[model entitiesByName] objectForKey:@"CategoryType"];
    [request setEntity:e];
    
    NSError *error;
    NSArray *result = [context executeFetchRequest:request error:&error];
    if (!result) {
        [NSException raise:@"Fetch failed"
                    format:@"Reason: %@", [error localizedDescription]];
    }
    
    return [[NSMutableArray alloc] initWithArray:result];
}

-(BOOL)saveChanges
{
    return [[RuckusStore defaultStore] saveChanges];
}

@end
