//
//  Category.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-03-30.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Category : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *categoryTypes;
@end

@interface Category (CoreDataGeneratedAccessors)

- (void)addCategoryTypesObject:(NSManagedObject *)value;
- (void)removeCategoryTypesObject:(NSManagedObject *)value;
- (void)addCategoryTypes:(NSSet *)values;
- (void)removeCategoryTypes:(NSSet *)values;

@end
