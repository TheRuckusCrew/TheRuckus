//
//  CategoryStore.m
//  TheRuckus
//
//  Created by Gagandeep Dulay on 2013-03-30.
//
//

#import "CategoryStore.h"

@implementation CategoryStore 
//
//-(void) fetchCategories
//{
//    NSFetchRequest *request = [[NSFetchRequest alloc]init];
//    NSEntityDescription *e = [[model entitiesByName] objectForKey:@"Category"];
//    [request setEntity:e];
//    NSError *error;
//    NSArray *result = [context executeFetchRequest:request error:&error];
//    if (!result){
//        [NSException raise:@"Fetch Failed" format:@"Reason : %@", [error localizedDescription]];
//    }
//    allCategories = [[NSMutableArray alloc] initWithArray:result];
//
//}
//
//-(Category *) createCategory : (NSString *)categoryName
//{
//    Category *c = [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:context];
//    [c setName:categoryName];
//    [allCategories addObject:c];
//    return c;
//}
//
//-(void) removeCategory: (Category *)c
//{
//    [context deleteObject:c];
//    [allCategories removeObjectIdenticalTo:c];
//}
//
@end
