//
//  FirstViewController.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-03-30.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface FirstViewController : UIViewController
{
    // Model objects
    NSMutableArray *allUsers;
    NSMutableArray *allManifestAlbums;
    NSMutableArray *allManifests;
    NSMutableArray *allCategories;
    NSMutableArray *allCategoryTypes;
    
    // dataModel
    NSManagedObjectContext *context;
    
    // Opens SQLite database
    NSManagedObjectModel *model;
}

@end
