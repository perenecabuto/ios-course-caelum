//
//  Contact.h
//  contatosip67
//
//  Created by ios6246 on 9/19/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

@interface Contact : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* phone;
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* address;
@property (nonatomic, strong) NSString* site;
@property (nonatomic, strong) UIImage* photo;

@property double lon;
@property double lat;

- (id)initWithName:(NSString*)name phone:(NSString*)phone email:(NSString*)email address:(NSString*)address site:(NSString*)site photo:(UIImage*)photo;
- (void)setCoords:(CLLocationCoordinate2D)coords;

@end
