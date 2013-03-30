//
//  FirstViewController.m
//  TheRuckus
//
//  Created by Warren Smith on 2013-03-30.
//
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Read in the dataModel
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSLog(@"Model: %@", model);
    
    //Opens a SQLite database at a particular filename
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
