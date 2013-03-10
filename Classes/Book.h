//
//  Book.h
//  CoreDataBooks
//
//  Created by Alexey Rashevskiy on 09/03/2013.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSDate * copyright;
@property (nonatomic, retain) NSNumber * price;

@end
