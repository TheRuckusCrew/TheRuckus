//
//  CategoryStore.h
//  TheRuckus
//
//  Created by Gagandeep Dulay on 2013-03-30.
//
//

#import <Foundation/Foundation.h>
#import "RuckusStore.h"

@interface CategoryStore : NSObject
{
    NSMutableArray *allCategories;
}
-(void) fetchCategories;
-(Category *) createCategory : (NSString *)categoryName;
-(void) removeCategory: (Category *)c;
@end
