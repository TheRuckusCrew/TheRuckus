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
    
    // Create RuckusStore singleton, initalize database
    [[RuckusStore defaultStore] initDatabase];
    
    // Create ManifestStore singleton, create Manifest object
    Manifest *createStore = [[ManifestStore defaultStore] createManifest];
    [createStore setCaption:@"Here's the caption"];
    NSLog(@"Sample store: %@", [createStore description]);
    
    // Save to database, calls up to RuckusStore Singleton
    [[ManifestStore defaultStore] saveChanges];
    
    // Uses ManifestStore singleton
    NSArray *fetchStores = [[ManifestStore defaultStore] fetchAllManifests];
    NSLog(@"Here's the fetched objects: %@", [fetchStores description]);
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
