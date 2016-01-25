//
//  Data.m
//  CoreData
//
//  Created by user on 16/1/25.
//  Copyright © 2016年 user. All rights reserved.
//

#import "Data.h"
#import "Person.h"
#import "Card.h"

@implementation Data

static Data *data;

+ (instancetype)shareData
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        data = [[Data alloc] init];
        
    });
    
    return data;
}

- (NSMutableArray *)makeData
{
    NSMutableArray *array = [NSMutableArray array];
    
    Person *person1 = [[Person alloc] init];
    person1.name = @"Sunny1";
    person1.age = 20;
    person1.id = @"10000";
    Card *card1 = [[Card alloc] init];
    card1.card_id = @"00";
    card1.image_url = @"dakdj";
    person1.card = card1;
    person1.avatarURL = @"avatar.png";
    person1.sex = 1;
    person1.address = @"北京";
    person1.national = @"汉";
    person1.birth_day = @"10";
    person1.birth_month = @"8";
    person1.birth_year = @"1990";
    
    
    Person *person2 = [[Person alloc] init];
    person2.name = @"Sunny2";
    person2.age = 20;
    person2.id = @"20000";
    Card *card2 = [[Card alloc] init];
    card2.card_id = @"02";
    card2.image_url = @"dakdj";
    person2.card = card2;
    person2.avatarURL = @"avatar.png";
    person2.sex = 0;
    person2.address = @"北京";
    person2.national = @"汉";
    person2.birth_day = @"10";
    person2.birth_month = @"8";
    person2.birth_year = @"1990";
    
    
    Person *person3 = [[Person alloc] init];
    person3.name = @"Sunny3";
    person3.age = 20;
    person3.id = @"30000";
    Card *card3 = [[Card alloc] init];
    card3.card_id = @"03";
    card3.image_url = @"dakdj";
    person3.card = card3;
    person3.avatarURL = @"avatar.png";
    person3.sex = 1;
    person3.address = @"北京";
    person3.national = @"汉";
    person3.birth_day = @"10";
    person3.birth_month = @"8";
    person3.birth_year = @"1990";
    
    
    Person *person4 = [[Person alloc] init];
    person4.name = @"Sunny4";
    person4.age = 20;
    person4.id = @"40000";
    Card *card4 = [[Card alloc] init];
    card4.card_id = @"04";
    card4.image_url = @"dakdj";
    person4.card = card4;
    person4.avatarURL = @"avatar.png";
    person4.sex = 1;
    person4.address = @"北京";
    person4.national = @"汉";
    person4.birth_day = @"10";
    person4.birth_month = @"8";
    person4.birth_year = @"1990";
    
    
    
    Person *person5 = [[Person alloc] init];
    person5.name = @"Sunny5";
    person5.age = 20;
    person5.id = @"50000";
    Card *card5 = [[Card alloc] init];
    card5.card_id = @"05";
    card5.image_url = @"dakdj";
    person5.card = card5;
    person5.avatarURL = @"avatar.png";
    person5.sex = 1;
    person5.address = @"北京";
    person5.national = @"汉";
    person5.birth_day = @"10";
    person5.birth_month = @"8";
    person5.birth_year = @"1990";
    
    
    
    Person *person6 = [[Person alloc] init];
    person6.name = @"Sunny6";
    person6.age = 20;
    person6.id = @"60000";
    Card *card6 = [[Card alloc] init];
    card6.card_id = @"06";
    card6.image_url = @"dakdj";
    person6.card = card6;
    person6.avatarURL = @"avatar.png";
    person6.sex = 1;
    person6.address = @"北京";
    person6.national = @"汉";
    person6.birth_day = @"10";
    person6.birth_month = @"8";
    person6.birth_year = @"1990";
    
    
    Person *person7 = [[Person alloc] init];
    person7.name = @"Sunny7";
    person7.age = 20;
    person7.id = @"70000";
    Card *card7 = [[Card alloc] init];
    card7.card_id = @"07";
    card7.image_url = @"dakdj";
    person7.card = card7;
    person7.avatarURL = @"avatar.png";
    person7.sex = 1;
    person7.address = @"北京";
    person7.national = @"汉";
    person7.birth_day = @"10";
    person7.birth_month = @"8";
    person7.birth_year = @"1990";
    
    
    
    Person *person8 = [[Person alloc] init];
    person8.name = @"Sunny8";
    person8.age = 20;
    person8.id = @"80000";
    Card *card8 = [[Card alloc] init];
    card8.card_id = @"08";
    card8.image_url = @"dakdj";
    person8.card = card8;
    person8.avatarURL = @"avatar.png";
    person8.sex = 1;
    person8.address = @"北京";
    person8.national = @"汉";
    person8.birth_day = @"10";
    person8.birth_month = @"8";
    person8.birth_year = @"1990";
    
    
    Person *person9 = [[Person alloc] init];
    person9.name = @"Sunny9";
    person9.age = 20;
    person9.id = @"90000";
    Card *card9 = [[Card alloc] init];
    card9.card_id = @"09";
    card9.image_url = @"dakdj";
    person9.card = card9;
    person9.avatarURL = @"avatar.png";
    person9.sex = 1;
    person9.address = @"北京";
    person9.national = @"汉";
    person9.birth_day = @"10";
    person9.birth_month = @"8";
    person9.birth_year = @"1990";
    
    Person *person10 = [[Person alloc] init];
    person10.name = @"Sunny10";
    person10.age = 20;
    person10.id = @"100000";
    Card *card10 = [[Card alloc] init];
    card10.card_id = @"10";
    card10.image_url = @"dakdj";
    person10.card = card10;
    person10.avatarURL = @"avatar.png";
    person10.sex = 1;
    person10.address = @"北京";
    person10.national = @"汉";
    person10.birth_day = @"10";
    person10.birth_month = @"8";
    person10.birth_year = @"1990";
    
    
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
    
    
    [array addObject:person1];
    [array addObject:person2];
    [array addObject:person3];
    [array addObject:person4];
    [array addObject:person5];
    [array addObject:person6];
    [array addObject:person7];
    [array addObject:person8];
    [array addObject:person9];
    [array addObject:person10];
    [array addObject:person11];
    
    return array;
}

@end
