//
//  CategoryType.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-03-30.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CategoryType : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *manifests;
@end

@interface CategoryType (CoreDataGeneratedAccessors)

- (void)addManifestsObject:(NSManagedObject *)value;
- (void)removeManifestsObject:(NSManagedObject *)value;
- (void)addManifests:(NSSet *)values;
- (void)removeManifests:(NSSet *)values;

@end
