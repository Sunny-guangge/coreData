//
//  Card.h
//  CoreData
//
//  Created by user on 16/1/19.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@class Person;
@interface Card : NSObject

@property (nonatomic,copy) NSString *card_id;

@property (nonatomic,strong) Person *person;

@property (nonatomic,copy) NSString *image_url;

@end
