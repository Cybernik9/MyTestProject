//
//  Cities.h
//  My test project
//
//  Created by Admin on 15.07.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cities : NSObject

@property (strong, nonatomic) NSString* nameCity;

+ (NSString*) getCity:(NSInteger) numberCity;
+ (NSString*) getAboutCity:(NSInteger) numberCity;
+ (NSMutableArray*) getCitiesArray;
+ (NSMutableArray*) getAboutCitiesArray;

@end
