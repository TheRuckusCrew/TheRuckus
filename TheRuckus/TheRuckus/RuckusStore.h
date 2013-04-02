//
//  RuckusStore.h
//  TheRuckus
//
//  Created by Gagandeep Dulay on 2013-03-30.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Category;

@interface RuckusStore : NSObject
{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

+(RuckusStore *)defaultStore;
+(id)allocWithZone:(NSZone *)zone;

-(id)init;
-(void)initDatabase;
-(BOOL)saveChanges;
@end
