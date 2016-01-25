//
//  ViewController.m
//  CoreData
//
//  Created by user on 16/1/19.
//  Copyright © 2016年 user. All rights reserved.
//

#import "ViewController.h"
#import "CKPersonCardView.h"
#import "Person.h"
#import "Card.h"
#import "CoreDataManager.h"
#import "Data.h"

@interface ViewController ()
{
    CKPersonCardView *cardView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    cardView = [[CKPersonCardView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 214 / 328)];
    
    Person *person = [[Person alloc] init];
    person.name = @"王帅广";
    person.sex = 1;
    person.national = @"汉";
    person.birth_year = @"1990";
    person.birth_month = @"12";
    person.birth_day = @"13";
    person.address = @"河南省南乐县张国屯乡西韩森固村1号";
    person.id = @"410923199008106119";
    person.avatarURL = @"avatar.png";
    
    cardView.person = person;
    
    Card *card = [[Card alloc] init];

    card.card_id = @"01";
    
    cardView.card = card;
    
    [self.view addSubview:cardView];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(didClickNextBarButtonItem)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(didClickDeleteBarButtonItem)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        
//        [[CoreDataManager shareCoreDataManager] insertWithPersonArray:[[Data shareData] makeData]];
//        
//        NSLog(@"%@",[NSSearchPathForDirectoriesInDomains(9, 1, 1) firstObject]);
//
//    });
    
    
    NSMutableArray *arrr = [[CoreDataManager shareCoreDataManager] checkOutWithPersonWithID:@"20000"];
    
////    Person *per = [arrr objectAtIndex:0];
//    
//    cardView.person = per;
//    
//    NSLog(@"%@",per);
    
    Person *person11 = [[Person alloc] init];
    person11.name = @"Sunny11";
    person11.age = 20;
    person11.id = @"110000";
    Card *card11 = [[Card alloc] init];
    card11.card_id = @"11";
    card11.image_url = @"dakdj";
    person11.card = card11;
    person11.avatarURL = @"avatar.png";
    person11.sex = 1;
    person11.address = @"北京";
    person11.national = @"汉";
    person11.birth_day = @"10";
    person11.birth_month = @"8";
    person11.birth_year = @"1990";
    
    NSMutableArray *deleteArray = [NSMutableArray array];
    
    [deleteArray addObject:person11];
    
    [[CoreDataManager shareCoreDataManager] deleteWithPersonArray:deleteArray];
    
    
}

- (void)didClickNextBarButtonItem
{
    
}

- (void)didClickDeleteBarButtonItem
{
    
}


@end
