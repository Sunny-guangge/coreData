//
//  CKPersonCardView.h
//  CoreData
//
//  Created by user on 16/1/19.
//  Copyright © 2016年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "Card.h"

@interface CKPersonCardView : UIView

@property (nonatomic,strong) Person *person;

@property (nonatomic,strong) Card *card;

@end
