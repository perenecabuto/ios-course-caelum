//
//  ContactRepository.m
//  contatosip67
//
//  Created by ios6246 on 9/19/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import "ContactRepository.h"
#import "CoreDataManager.h"

# pragma Persistent Objects

@interface ContactDB : NSManagedObject
@property NSString* name;
@property NSString* phone;
@property NSString* email;
@property NSString* address;
@property NSString* site;
@property UIImage* photo;
@property NSNumber* lon;
@property NSNumber* lat;

- (void)syncFromContact:(Contact*)c;
@end


@implementation ContactDB
@dynamic name, phone, email, address, site, photo, lat, lon;

- (void)syncFromContact:(Contact *)c {
    self.name = c.name;
    self.phone = c.phone;
    self.email = c.email;
    self.site = c.site;
    self.photo = c.photo;
    self.lat = [NSNumber numberWithDouble:c.lat];
    self.lon = [NSNumber numberWithDouble:c.lon];
}

@end


# pragma Repository

@implementation ContactRepository

static ContactRepository* instance;

+ (id) sharedManager {
    if (!instance) {
        instance = [ContactRepository new];
    }
    return instance;
}

- (Contact *)contactByID:(NSInteger)_id {
    return [_contacts objectAtIndex:_id];
}

- (NSInteger)getContactID:(Contact *)contact {
    return [_contacts indexOfObject:contact];
}

- (void)add:(Contact *)contact {
    CoreDataManager* manager = [CoreDataManager sharedManager];
    ContactDB* row = [NSEntityDescription insertNewObjectForEntityForName:@"Contato" inManagedObjectContext:[manager managedObjectContext]];
    [row syncFromContact:contact];
    [manager saveContext];
}

- (void) update:(Contact*)contact byID:(NSInteger)id_ {
    CoreDataManager* manager = [CoreDataManager sharedManager];
    ContactDB* row = [NSEntityDescription insertNewObjectForEntityForName:@"Contato" inManagedObjectContext:[manager managedObjectContext]];
    [row syncFromContact:contact];
    [manager saveContext];
    [_contacts setObject:contact atIndexedSubscript:id_];
}

- (void)remove:(Contact *)contact {
    [_contacts removeObject:contact];
}

- (NSArray<Contact*> *)listAll {
    CoreDataManager* manager = [CoreDataManager sharedManager];
    NSFetchRequest* query = [NSFetchRequest fetchRequestWithEntityName:@"Contato"];
    NSArray<ContactDB*>* data = [[manager managedObjectContext] executeFetchRequest:query error:nil];
    _contacts = [@[] mutableCopy];
    for (ContactDB* c in data) {
        Contact* contact = [[Contact alloc] initWithName:c.name phone:c.phone email:c.email address:c.address site:c.address photo:c.photo];
        contact.lat = [c.lat doubleValue];
        contact.lon = [c.lon doubleValue];
        [_contacts addObject:contact];
    }
    return _contacts;
}

- (NSUInteger)count {
    return [_contacts count];
}

@end