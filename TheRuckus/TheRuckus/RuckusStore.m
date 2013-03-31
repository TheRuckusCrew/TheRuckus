//
//  RuckusStore.m
//  TheRuckus
//
//  Created by Gagandeep Dulay on 2013-03-30.
//
//

#import "RuckusStore.h"

@implementation RuckusStore
{
    -(id) init
    {
        //Read in RuckusDataModel
        model = [NSManagedObjectModel mergedModelFromBundles:nil];
        //    NSLog(@"The model is : %@", model);
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        
        /*
         //SQLite location
         NSString *path = pathInDocumentDirectory(@"store.data");
         NSURL *storeURL = [NSURL fileURLWithPath:path];*/
        
        // Where does the SQLite file go?
        NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* basePath = [paths objectAtIndex:0];
        NSURL* storeUrl = [NSURL fileURLWithPath:[basePath stringByAppendingPathComponent: @"RuckusDatabase.sqlite"]];
        NSLog(@"storeUrl = %@", [storeUrl description]);
        
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
        NSLog(@"Create Category");
        [self createCategory];
        NSLog(@"Save Changes");
        if ([self savChanges])
        {
            NSLog(@"Saving Changes was successfull");
            [self fetchCategories];
            NSLog(@"The Categories are : %@",[allCategories description]);
        }
        else
        {
            NSLog(@"Not able to save changes");
        }
        

    }
    
    -(BOOL) savChanges
    {
        NSError *err = nil;
        BOOL successful = [context save:&err];
        if (!successful)
        {
            NSLog(@"Error saving : %@", [err localizedDescription]);
        }
        return successful;
    }
    
    -(void) fetchCategories
    {
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        NSEntityDescription *e = [[model entitiesByName] objectForKey:@"Category"];
        [request setEntity:e];
        //NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"orderingValue" ascending:YES];
        //[request setSortDescriptors:[NSArray arrayWithObject:sd]];
        NSError *error;
        NSArray *result = [context executeFetchRequest:request error:&error];
        if (!result){
            [NSException raise:@"Fetch Failed" format:@"Reason : %@", [error localizedDescription]];
        }
        
        allCategories = [[NSMutableArray alloc] initWithArray:result];
        //NSLog(@"Fetched this object: %@", [allCategories description]);
    }
    
    -(Category *) createCategory
    {
        Category *c = [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:context];
        [c setName:@"TestCategory3"];
        [allCategories addObject:c];
        
        //NSLog(@"Created this object: %@", [c description]);
        return c;
    }
    
    -(void) removeCategory: (Category *)c
    {
        [context deleteObject:c];
        [allCategories removeObjectIdenticalTo:c];
    }
}
@end
