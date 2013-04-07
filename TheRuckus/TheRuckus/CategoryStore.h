//
//  CategoryStore.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-04-01.
//
//

#import <UIKit/UIKit.h>
#import "RuckusStore.h"
#import "Category.h"

@interface CategoryStore : NSObject
{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

+(CategoryStore *)defaultStore;
+(id)allocWithZone:(NSZone *)zone;

-(Category *)createCategory;
-(NSArray *)fetchAllCategories;
-(BOOL)saveChanges;

@end
