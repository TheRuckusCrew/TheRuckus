//
//  User.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-03-30.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ManifestAlbum;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSSet *manifestAlbums;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addManifestAlbumsObject:(ManifestAlbum *)value;
- (void)removeManifestAlbumsObject:(ManifestAlbum *)value;
- (void)addManifestAlbums:(NSSet *)values;
- (void)removeManifestAlbums:(NSSet *)values;

@end
