//
//  Manifest.h
//  TheRuckus
//
//  Created by Warren Smith on 2013-03-30.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Manifest : NSManagedObject

@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSString * caption;

@end
