//
//  FirstViewController.m
//  TheRuckus
//
//  Created by Warren Smith on 2013-03-30.
//
//

#import "FirstViewController.h"
#import "Category.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    
    // Read in RuckusDataMode.xcdatamodeld
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
//    NSLog(@"model = %@", model);
    
    // Used to open a SQLite database at a particular file name
    NSPersistentStoreCoordinator *psc =
    [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    // Where does the SQLite file go?
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* basePath = [paths objectAtIndex:0];
    NSURL* storeUrl = [NSURL fileURLWithPath:[basePath stringByAppendingPathComponent: @"RuckusDatabase.sqlite"]];
//    NSLog(@"storeUrl = %@", [storeUrl description]);

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
    
    // Create the managed object context
    context = [[NSManagedObjectContext alloc] init];
    [context setPersistentStoreCoordinator:psc];
    
    // The managed object context can manage undo, but we don't need it
    [context setUndoManager:nil];
    
     NSLog(@"First Fetch");
    [self fetchCategories];
    [self createCategory];
     NSLog(@"Third Fetch");
    [self fetchCategories];
}

-(Category *) createCategory
{
    Category *c = [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:context];
    
    [c setName:@"TestCategory1"];

    [self saveChanges];
    
    NSLog(@"Created: %@", [c description]);
    return c;
}
-(void) fetchCategories
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setReturnsObjectsAsFaults:NO];
    NSEntityDescription *e = [[model entitiesByName] objectForKey:@"Category"];
    [request setEntity:e];
    
    NSError *error;
    NSArray *result = [context executeFetchRequest:request error:&error];
    if (!result){
        [NSException raise:@"Fetch Failed" format:@"Reason : %@", [error localizedDescription]];
    }
    NSLog(@"Fetched: %@", [result description]);
}

- (BOOL)saveChanges
{
    NSError *err = nil;
    BOOL successful = [context save:&err];
    if (!successful) {
        NSLog(@"Error saving: %@", [err localizedDescription]);
    }
    return successful;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
