//
//  ManifestAlbumStore.m
//  TheRuckus
//
//  Created by Warren Smith on 2013-04-01.
//
//  Responsible for creating Manifest objects and passing them back to ViewControllers.
//  Provides creation and fetch methods.


#import "ManifestAlbumStore.h"

@implementation ManifestAlbumStore

static ManifestAlbumStore *defaultStore = nil;

// Creates a singleton instance of ManifestStore
+(ManifestAlbumStore *)defaultStore
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

-(ManifestAlbum *)createManifestAlbum
{
    ManifestAlbum *ma = [NSEntityDescription insertNewObjectForEntityForName:@"ManifestAlbum"
                                                      inManagedObjectContext:context];
    return ma;
}

-(NSArray *)fetchAllManifestAlbums
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *e = [[model entitiesByName] objectForKey:@"ManifestAlbum"];
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
