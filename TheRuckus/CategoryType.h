//
//  CategoryType.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-05-02.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Manifest;

@interface CategoryType : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSSet *manifests;
@end

@interface CategoryType (CoreDataGeneratedAccessors)

- (void)addManifestsObject:(Manifest *)value;
- (void)removeManifestsObject:(Manifest *)value;
- (void)addManifests:(NSSet *)values;
- (void)removeManifests:(NSSet *)values;

@end
