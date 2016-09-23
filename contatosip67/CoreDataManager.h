//
//  CoreDataManager.h
//  contatosip67
//
//  Created by ios6246 on 9/23/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (id) sharedManager;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
