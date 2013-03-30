//
//  ManifestAlbum.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-03-30.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Manifest;

@interface ManifestAlbum : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *manifests;
@end

@interface ManifestAlbum (CoreDataGeneratedAccessors)

- (void)addManifestsObject:(Manifest *)value;
- (void)removeManifestsObject:(Manifest *)value;
- (void)addManifests:(NSSet *)values;
- (void)removeManifests:(NSSet *)values;

@end
