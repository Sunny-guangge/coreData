//
//  CoreDataManager.m
//  CoreData
//
//  Created by user on 16/1/22.
//  Copyright © 2016年 user. All rights reserved.
//

#import "CoreDataManager.h"
#import <CoreData/CoreData.h>
#import "Person.h"
#import "Card.h"
#import <UIKit/UIKit.h>

static CoreDataManager *manager;

@implementation CoreDataManager

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (instancetype)shareCoreDataManager
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[CoreDataManager alloc] init];
    });
    return manager;
}

- (id)init
{
    self = [super self];
    
    if (self) {
        
        [self managedObjectContext];
        
    }
    return self;
}

#pragma mark - Setter & Getter
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:url];
    
    return _managedObjectModel;
}

- (NSURL *)urlPath
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    NSURL *url = [[self urlPath] URLByAppendingPathComponent:@"Model.sqlite"];
    
    [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:nil];
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    
    return _managedObjectContext;
}

#pragma mark - 保存
- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//            abort();
        }
    }
}

#pragma mark - 增、删、检索
- (void)insertWithPersonArray:(NSMutableArray *)array
{
    for (Person *person in array) {
        
        NSManagedObject *personObject = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
        
        [personObject setValue:person.name forKey:@"name"];
        [personObject setValue:[NSNumber numberWithInteger:person.age] forKey:@"age"];
        [personObject setValue:person.id forKey:@"id"];
        
        NSManagedObject *cardObject = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:self.managedObjectContext];
        
        [cardObject setValue:person.card.card_id forKey:@"card_id"];
        [cardObject setValue:personObject forKey:@"person"];
        [cardObject setValue:person.card.image_url forKey:@"image_url"];
        
        [personObject setValue:cardObject forKey:@"card"];
        
        [personObject setValue:person.avatarURL forKey:@"avatarURL"];
        [personObject setValue:[NSNumber numberWithInteger:person.sex] forKey:@"sex"];
        [personObject setValue:person.address forKey:@"address"];
        [personObject setValue:person.national forKey:@"national"];
        [personObject setValue:person.birth_year forKey:@"birth_year"];
        [personObject setValue:person.birth_month forKey:@"birth_month"];
        [personObject setValue:person.birth_day forKey:@"birth_day"];
        
    }
    
    [self saveContext];
    
}

- (void)insertWIthCardArray:(NSMutableArray *)array
{
    for (Card *card in array) {
        
        NSManagedObject *cardObject = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:self.managedObjectContext];
        
        [cardObject setValue:card.image_url forKey:@"image_url"];
        [cardObject setValue:card.card_id forKey:@"card_id"];
        [cardObject setValue:card.person forKey:@"person"];
        
    }
    
    [self saveContext];
}

- (void)deleteWithPersonArray:(NSMutableArray *)array
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
    
    for (Person *person in array) {
        // 设置条件过滤(搜索name中包含字符串"Itcast-1"的记录，注意：设置条件过滤时，数据库SQL语句中的%要用*来代替，所以%Itcast-1%应该写成*Itcast-1*)
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"id == %@", person.id];
        request.predicate = predicate;
        
        // 执行请求
        NSError *error = nil;
        NSArray *objs = [self.managedObjectContext executeFetchRequest:request error:&error];
        
        for (NSManagedObject *objc in objs) {
            
            [self.managedObjectContext deleteObject:objc];
            
        }
    }
    
    [self saveContext];
}

- (void)deleteWithCardArray:(NSMutableArray *)array
{
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    request.entity = [NSEntityDescription entityForName:@"Card" inManagedObjectContext:self.managedObjectContext];
    
    for (Card *card in array) {
        // 设置条件过滤(搜索name中包含字符串"Itcast-1"的记录，注意：设置条件过滤时，数据库SQL语句中的%要用*来代替，所以%Itcast-1%应该写成*Itcast-1*)
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"id == %@", card.card_id];
        request.predicate = predicate;
        
        // 执行请求
        NSError *error = nil;
        NSArray *objs = [self.managedObjectContext executeFetchRequest:request error:&error];
        
        for (NSManagedObject *objc in objs) {
            
            [self.managedObjectContext deleteObject:objc];
            
        }
    }
    
    [self saveContext];
}

- (NSMutableArray *)checkOutWithPersonWithID:(NSString *)PersonID
{
    NSMutableArray *array = [NSMutableArray array];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
    
    //设置排序
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES];
    
    request.sortDescriptors = [NSArray arrayWithObject:sort];
    
    // 设置条件过滤(搜索name中包含字符串"Itcast-1"的记录，注意：设置条件过滤时，数据库SQL语句中的%要用*来代替，所以%Itcast-1%应该写成*Itcast-1*)
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"id == %@", PersonID];
    request.predicate = predicate;
    // 执行请求
    NSError *error = nil;
    NSArray *objs = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    // 遍历数据
    for (NSManagedObject *obj in objs) {
        
        Person *person = [[Person alloc] init];
        
        person.name = [obj valueForKey:@"name"];
        person.age = [[obj valueForKey:@"age"] integerValue];
        person.id = [obj valueForKey:@"id"];
        person.card = [obj valueForKey:@"card"];
        person.avatarURL = [obj valueForKey:@"avatarURL"];
        person.sex = [[obj valueForKey:@"sex"] integerValue];
        person.address = [obj valueForKey:@"address"];
        person.national = [obj valueForKey:@"national"];
        person.birth_day = [obj valueForKey:@"birth_day"];
        person.birth_month = [obj valueForKey:@"birth_month"];
        person.birth_year = [obj valueForKey:@"birth_year"];
        
        [array addObject:person];
    }
    
    return array;
}

- (NSMutableArray *)checkOutWithCardWithID:(NSString *)cardID
{
    NSMutableArray *array = [NSMutableArray array];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    request.entity = [NSEntityDescription entityForName:@"Card" inManagedObjectContext:self.managedObjectContext];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"card_id" ascending:NO];
    request.sortDescriptors = [NSArray arrayWithObject:sort];
    
    NSError *error = nil;
    NSArray *arr = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error) {
        [NSException raise:@"查询错误" format:@"%@",[error localizedDescription]];
    }
    
    for (NSManagedObject *cardObject in arr) {
        
        Card *card = [[Card alloc] init];
        card.card_id = [cardObject valueForKey:@"card_id"];
        card.person = [cardObject valueForKey:@"person"];
        card.image_url = [cardObject valueForKey:@"image_url"];
        [array addObject:card];
        
    }
    
    return array;
}



@end
