//
//  UserStore.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-04-01.
//
//

#import <UIKit/UIKit.h>
#import "RuckusStore.h"
#import "User.h"

@interface UserStore : NSObject
{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}
+(UserStore *) defaultStore;
+(id)allocWithZone:(NSZone *)zone;

-(User *)createUser;
-(NSArray *)fetchAllUsers;
-(BOOL)saveChanges;

@end
