//
//  SecondViewController.m
//  TheRuckus
//
//  Created by Warren Smith on 2013-03-30.
//
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Now in second view");
    
    //Read in RuckusDataModel
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSLog(@"The model is : %@", model);
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    /*
    //SQLite location
    NSString *path = pathInDocumentDirectory(@"store.data");
    NSURL *storeURL = [NSURL fileURLWithPath:path];*/

    context = [[NSManagedObjectContext alloc]init];
    [context setPersistentStoreCoordinator:psc];
    [context setUndoManager:nil];
    
    [self createCategory];
    
    [self fetchCategories];
    NSLog(@"The Categories are : %@",[allCategories description]);
    

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
    NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"orderingValue" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:sd]];
    NSError *error;
    NSArray *result = [context executeFetchRequest:request error:&error];
    if (!result){
        [NSException raise:@"Fetch Failed" format:@"Reason : %@", [error localizedDescription]];
    }
    allCategories = [[NSMutableArray alloc] initWithArray:result];
}

-(Category *) createCategory
{
    Category *c = [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:context];
    
    [c setName:@"TestCategory1"];
    [allCategories addObject:c];
    [self savChanges];
    
    return c;
}

-(void) removeCategory: (Category *)c
{
    [context deleteObject:c];
    [allCategories removeObjectIdenticalTo:c];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
