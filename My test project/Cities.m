//
//  Cities.m
//  My test project
//
//  Created by Admin on 15.07.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "Cities.h"

@implementation Cities

static NSString* city[] = {
    @"Paris", @"London", @"Berlin", @"Lviv", @"Kyiv",
    @"Krakow", @"Warsaw", @"Oslo", @"Moscow", @"St. Petersburg"
};

static NSString* aboutCity[] = {
    @"Paris is the capital of France",
    @"London is the capital of Great Britain",
    @"Berlin is the capital of Germany",
    @"Lviv is the cultural capital of Ukraine",
    @"Kyiv is the capital of Ukraine",
    @"Krakow is the cultural capital of Poland",
    @"Warsaw is the capital of Poland",
    @"Oslo is the capital of Norway",
    @"Moscow is the capital of Russia",
    @"St. Petersburg is the cultural capital of Russia"
};

static int cityCount = 10;

+ (NSString*) getCity:(NSInteger) numberCity {
    
    return city[numberCity];
    
}

+ (NSString*) getAboutCity:(NSInteger) numberCity {
    
    return aboutCity[numberCity];
    
}

+ (NSMutableArray*) getCitiesArray {
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    for (int i=0; i < cityCount; i++) {
        [array addObject:city[i]];
    }
    
    return array;
}

+ (NSMutableArray*) getAboutCitiesArray {
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    for (int i=0; i < cityCount; i++) {
        [array addObject:aboutCity[i]];
    }
    
    return array;
    
}

@end
