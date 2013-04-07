//
//  RuckusStore.h
//  TheRuckus
//
//  Created by Gagandeep Dulay on 2013-03-30.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "User.h"
#import "ManifestAlbum.h"
#import "Manifest.h"
#import "CategoryType.h"
#import "Category.h"

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
