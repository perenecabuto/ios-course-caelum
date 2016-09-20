//
//  ContactFormViewController.m
//  contatosip67
//
//  Created by ios6246 on 19/09/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import "ContactFormViewController.h"
#import "Contact.h"
#import "ContactRepository.h"

@implementation ContactFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Cadastro"];
}

- (IBAction)addContact:(id)sender {
    Contact* c = [[Contact alloc] initWithName:_name.text phone:_phone.text email:_email.text address:_address.text site:_site.text];
    [[ContactRepository sharedManager] add:c];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
