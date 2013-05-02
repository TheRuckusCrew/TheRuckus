//
//  Category.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-05-02.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CategoryType;

@interface Category : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSSet *categoryTypes;
@end

@interface Category (CoreDataGeneratedAccessors)

- (void)addCategoryTypesObject:(CategoryType *)value;
- (void)removeCategoryTypesObject:(CategoryType *)value;
- (void)addCategoryTypes:(NSSet *)values;
- (void)removeCategoryTypes:(NSSet *)values;

@end
