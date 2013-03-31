//
//  RuckusStore.h
//  TheRuckus
//
//  Created by Gagandeep Dulay on 2013-03-30.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Category.h"

@class Category;

@interface RuckusStore : NSObject
{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
    NSMutableArray *allCategories;
    
}
@end
