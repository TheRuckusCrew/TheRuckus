//
//  CategoryStore.m
//  TheRuckus
//
//  Created by Gagandeep Dulay on 2013-03-30.
//
//

#import "CategoryStore.h"

@implementation CategoryStore 

-(void) fetchCategories
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *e = [[model entitiesByName] objectForKey:@"Category"];
    [request setEntity:e];
    NSError *error;
    NSArray *result = [context executeFetchRequest:request error:&error];
    if (!result){
        [NSException raise:@"Fetch Failed" format:@"Reason : %@", [error localizedDescription]];
    }
    
    allCategories = [[NSMutableArray alloc] initWithArray:result];
    //NSLog(@"Fetched this object: %@", [allCategories description]);
}

-(Category *) createCategory
{
    Category *c = [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:context];
    [c setName:@"TestCategory3"];
    [allCategories addObject:c];
    //NSLog(@"Created this object: %@", [c description]);
    return c;
}

-(void) removeCategory: (Category *)c
{
    [context deleteObject:c];
    [allCategories removeObjectIdenticalTo:c];
}

@end
