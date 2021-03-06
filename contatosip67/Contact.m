//
//  Contact.m
//  contatosip67
//
//  Created by ios6246 on 9/19/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@implementation Contact

- (id)initWithName:(NSString*)name phone:(NSString*)phone email:(NSString*)email address:(NSString*)address site:(NSString*)site photo:(UIImage*)photo
{
    self = [super init];
    if (self) {
        self.name = name;
        self.phone = phone;
        self.email = email;
        self.address = address;
        self.site = site;
        self.photo = photo;
    }
    return self;
}

- (void)setCoords:(CLLocationCoordinate2D)coords {
    _lat = coords.latitude;
    _lon = coords.longitude;
}

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(_lat, _lon);
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ (%@) <%@>", _name, _phone, _email];
}

- (NSString*)title {
    return self.name;
}

- (NSString*)subtitle {
    return self.address;
}

@end
