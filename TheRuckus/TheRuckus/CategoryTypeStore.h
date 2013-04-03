//
//  CategoryTypeStore.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-04-01.
//
//

#import <UIKit/UIKit.h>
#import "RuckusStore.h"
#import "CategoryType.h"

@interface CategoryTypeStore : NSObject
{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

+(CategoryTypeStore *)defaultStore;
+(id)allocWithZone:(NSZone *)zone;

-(CategoryType *)createCategoryType;
-(NSArray *)fetchAllCategoryTypes;
-(BOOL)saveChanges;

@end
