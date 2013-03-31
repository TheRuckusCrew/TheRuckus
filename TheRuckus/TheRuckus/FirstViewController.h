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
    NSMutableArray *userArray;
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

- (NSArray *) allUsers;
- (BOOL) saveChanges;
- (void) fetchUsers;
@end
