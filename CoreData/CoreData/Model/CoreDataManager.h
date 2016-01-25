//
//  CoreDataManager.h
//  CoreData
//
//  Created by user on 16/1/22.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

+ (instancetype)shareCoreDataManager;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;

- (void)insertWithPersonArray:(NSMutableArray *)array;

- (void)insertWIthCardArray:(NSMutableArray *)array;

- (void)deleteWithPersonArray:(NSMutableArray *)array;

- (void)deleteWithCardArray:(NSMutableArray *)array;

- (NSMutableArray *)checkOutWithPersonWithID:(NSString *)PersonID;

- (NSMutableArray *)checkOutWithCardWithID:(NSString *)cardID;

- (void)deleteExmaple;

@end
