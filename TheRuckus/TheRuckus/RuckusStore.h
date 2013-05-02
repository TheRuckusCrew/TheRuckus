//
//  RuckusStore.h
//  TheRuckus
//
//  Created by Gagandeep Dulay on 2013-03-30.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CategoryStore.h"
#import "UserStore.h"
#import "CategoryTypeStore.h"
#import "ManifestAlbumStore.h"
#import "ManifestStore.h"

@interface RuckusStore : NSObject
{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
    BOOL databaseCreated;
}

+(RuckusStore *)defaultStore;
+(id)allocWithZone:(NSZone *)zone;

-(id)init;
-(void)initDatabase;
-(void)populateDatabase;
-(BOOL)saveChanges;
-(NSManagedObjectContext *)getContext;
-(NSManagedObjectModel *)getModel;

@end
