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
    
    // Initalize database
    [[RuckusStore defaultStore] initDatabase];
    
    // Create Manifest Object
    Manifest *createStore = [[ManifestStore defaultStore] createManifest];
    [createStore setCaption:@"Here's the caption"];
    
    // Save to database
    [[ManifestStore defaultStore] saveChanges];
    
    // Fetch object
    NSArray *fetchStores = [[ManifestStore defaultStore] fetchAllManifests];
    NSLog(@"Here's the fetched objects: %@", [fetchStores description]);
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
