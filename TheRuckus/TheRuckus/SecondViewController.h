//
//  SecondViewController.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-03-30.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Category.h"

@class Category;

@interface SecondViewController : UIViewController
{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
    NSMutableArray *allCategories;
    
}
@end
