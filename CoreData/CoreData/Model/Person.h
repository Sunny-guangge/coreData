//
//  Person.h
//  CoreData
//
//  Created by user on 16/1/19.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@class Card;
@interface Person : NSObject

@property (nonatomic,copy) NSString *name;

@property (nonatomic,assign) NSInteger age;

@property (nonatomic,copy) NSString *id;

@property (nonatomic,strong) Card *card;

@property (nonatomic,copy) NSString *avatarURL;

@property (nonatomic,assign) NSInteger sex;

@property (nonatomic,copy) NSString *address;

@property (nonatomic,copy) NSString *national;

@property (nonatomic,copy) NSString *birth_year;

@property (nonatomic,copy) NSString *birth_month;

@property (nonatomic,copy) NSString *birth_day;

@end
