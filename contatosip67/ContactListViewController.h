//
//  ContactListViewController.h
//  contatosip67
//
//  Created by ios6246 on 9/20/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "ContactFormViewController.h"


@interface ContactListViewController : UITableViewController <ContactFormViewControllerDelegate>

@property (nonatomic, strong) Contact* selectedContact;

- (void)showContactForm;

@end
