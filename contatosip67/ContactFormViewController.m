//
//  ContactFormViewController.m
//  contatosip67
//
//  Created by ios6246 on 19/09/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import "ContactFormViewController.h"
#import "ContactRepository.h"

@implementation ContactFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Cadastro"];
    
    UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                  target:self
                                                  action:@selector(addContact:)];
    
    [self.navigationItem setRightBarButtonItem:button];
    
    if (self.contact) {
        _name.text = self.contact.name;
        _address.text = self.contact.address;
        _phone.text = self.contact.phone;
        _email.text = self.contact.email;
        _site.text = self.contact.site;
    }
}

- (IBAction)addContact:(id)sender {
    Contact* c = [[Contact alloc] initWithName:_name.text phone:_phone.text email:_email.text address:_address.text site:_site.text];
    if (self.contact) {
        NSInteger id_ = [[ContactRepository sharedManager] getContactID:self.contact];
        [[ContactRepository sharedManager] update:c byID:id_];
    } else {
        [[ContactRepository sharedManager] add:c];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
