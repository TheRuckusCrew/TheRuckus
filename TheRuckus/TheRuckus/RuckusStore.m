//
//  RuckusStore.m
//  TheRuckus
//
//  Created by Gagandeep Dulay on 2013-03-30.
//
//

#import "RuckusStore.h"

@implementation RuckusStore

-(id) init
{
//    if (defaultStore)
//    {
//        return defaultStore;
//    }
    self = [super init];
    
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
    //        NSLog(@"The model is : %@", model);
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    // Where does the SQLite file go?
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* basePath = [paths objectAtIndex:0];
    NSURL* storeUrl = [NSURL fileURLWithPath:[basePath stringByAppendingPathComponent: @"RuckusDatabase.sqlite"]];
    //        NSLog(@"storeUrl = %@", [storeUrl description]);
    
    NSError *error = nil;
    
    // Add a new SQLite database that the PersistentStoreCoordinator interacts with
    if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                           configuration:nil
                                     URL:storeUrl
                                 options:nil
                                   error:&error]) {
        [NSException raise:@"Open failed"
                    format:@"Reason: %@", [error localizedDescription]];
    }
    
    context = [[NSManagedObjectContext alloc]init];
    [context setPersistentStoreCoordinator:psc];
    [context setUndoManager:nil];
    
    return self;
}

-(BOOL) saveChanges
{
    NSError *err = nil;
    BOOL successful = [context save:&err];
    if (!successful)
    {
        NSLog(@"Error saving : %@", [err localizedDescription]);
    }
    return successful;
}

@end
