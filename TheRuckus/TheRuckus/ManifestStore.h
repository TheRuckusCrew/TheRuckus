//
//  ManifestStore.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-04-01.
//
//

#import <UIKit/UIKit.h>
#import "RuckusStore.h"
#import "Manifest.h"

@interface ManifestStore : NSObject
{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

+(ManifestStore *)defaultStore;
+(id)allocWithZone:(NSZone *)zone;

-(Manifest *)createManifest;
-(NSArray *)fetchAllManifests;

@end
