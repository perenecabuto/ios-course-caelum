//
//  ContactRepository.h
//  contatosip67
//
//  Created by ios6246 on 9/19/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactRepository : NSObject

+ (id) sharedManager;

- (Contact *)find:(NSInteger)_id;
- (void) add:(Contact*)contact;
- (void) remove:(Contact*)contact;
- (NSArray<Contact*> *)listAll;
- (NSUInteger)count;

@end
