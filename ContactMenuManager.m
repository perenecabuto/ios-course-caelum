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
    }
}

@end
