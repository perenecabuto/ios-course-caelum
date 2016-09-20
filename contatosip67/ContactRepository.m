//
//  ContactRepository.m
//  contatosip67
//
//  Created by ios6246 on 9/19/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import "ContactRepository.h"

@interface ContactRepository ()

@property (strong, nonatomic) NSMutableArray* contacts;

@end


@implementation ContactRepository

static ContactRepository* instance;

+ (id) sharedManager {
    if (!instance) {
        instance = [ContactRepository new];
    }
    return instance;
}

- (id) init {
    self = [super init];
    if (self) {
        _contacts = [NSMutableArray new];
    }
    return self;
}

- (Contact *)find:(NSInteger)_id {
    return [_contacts objectAtIndex:_id];
}

- (void)add:(Contact *)contact {
    [_contacts addObject:contact];
}

- (void)remove:(Contact *)contact {
    [_contacts removeObject:contact];
}

- (NSArray<Contact*> *)listAll {
    return _contacts;
}

- (NSUInteger)count {
    return [_contacts count];
}

@end
