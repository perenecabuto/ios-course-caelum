//
//  ContactMenuManager.m
//  contatosip67
//
//  Created by ios6246 on 9/22/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import "ContactMenuManager.h"
@import MessageUI;

@implementation ContactMenuManager

- (id)initWithContact:(Contact*)contact {
    self = [super init];
    if (self) {
        _contact = contact;
    }

    return self;
}

- (void)showInView:(UIView*)view {
    UIActionSheet* actionSheet =
    [[UIActionSheet alloc] initWithTitle: _contact.name
                                delegate: self
                       cancelButtonTitle: @"Cancelar"
                  destructiveButtonTitle: nil
                       otherButtonTitles: @"Ligar", @"Site", @"Mapa", @"Email", nil];

    [actionSheet showInView:view];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [self callContact];
            break;
        case 1:
            [self openContactSite];
            break;
        case 2:
            [self showContactPositionOnMap];
            break;
        case 3:
            [self sendEmailToContact];
            break;
        default:
            break;
    }
}

- (void)callContact {
    UIDevice *device = [UIDevice currentDevice];
    if ([device.model isEqualToString:@"iPhone"]) {
        NSString* phoneURL = [NSString stringWithFormat:@"tel:%@", _contact.phone];
        [self openURL:phoneURL];
    }
    
    NSLog(@"Call - %@", _contact.phone);
}

- (void)openContactSite {
    [self openURL:_contact.site];
}

- (void)showContactPositionOnMap {
    NSString* mapURL = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", _contact.address]
                        stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [self openURL:mapURL];
}

- (void)sendEmailToContact {
    MFMailComposeViewController* emailVC = [MFMailComposeViewController new];
    [emailVC setToRecipients:@[_contact.email]];

    UIViewController* rootVC = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [rootVC presentViewController:emailVC animated:YES completion:nil];
}

- (void)openURL:(NSString*)strURL {
    NSURL* url = [NSURL URLWithString:strURL];
    [[UIApplication sharedApplication] openURL:url];
}

@end
