//
//  ManifestAlbumStore.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-04-01.
//
//

#import <UIKit/UIKit.h>
#import "RuckusStore.h"
#import "ManifestAlbum.h"

@interface ManifestAlbumStore : NSObject
{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

+(ManifestAlbumStore *)defaultStore;
+(id)allocWithZone:(NSZone *)zone;

-(ManifestAlbumStore *)createManifestAlbum;
-(NSArray *)fetchAllManifestAlbums;
-(BOOL)saveChanges;

@end
