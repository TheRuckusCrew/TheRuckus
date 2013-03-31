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
    
}
-(void) fetchCategories;
-(Category *) createCategory;
-(void) removeCategory: (Category *)c
@end
