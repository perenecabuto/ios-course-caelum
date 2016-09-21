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
    
    Contact* contact = [self.delegate selectedConctact];
    if (contact) {
        [button setAction:@selector(updateContact:)];
        _name.text = contact.name;
        _address.text = contact.address;
        _phone.text = contact.phone;
        _email.text = contact.email;
        _site.text = contact.site;
    }
    
    [self.navigationItem setRightBarButtonItem:button];
}

- (void)updateContact:(id)sender {
    if (!self.delegate || ![self.delegate selectedConctact]) {
        return;
    }
    
    Contact* c = [[Contact alloc] initWithName:_name.text phone:_phone.text email:_email.text address:_address.text site:_site.text];
    NSInteger id_ = [[ContactRepository sharedManager] getContactID:[self.delegate selectedConctact]];
    [[ContactRepository sharedManager] update:c byID:id_];
    [self.delegate hightlightContact:c];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addContact:(id)sender {
    Contact* c = [[Contact alloc] initWithName:_name.text phone:_phone.text email:_email.text address:_address.text site:_site.text];
    [[ContactRepository sharedManager] add:c];
    [self.delegate hightlightContact:c];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
