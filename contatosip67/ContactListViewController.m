//
//  ContactListViewController.m
//  contatosip67
//
//  Created by ios6246 on 9/20/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import "ContactListViewController.h"
#import "ContactFormViewController.h"
#import "ContactRepository.h"

@implementation ContactListViewController

const NSInteger SECTIONS = 1;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                  target:self
                                                  action:@selector(showContactForm)];
    
    [self.navigationItem setRightBarButtonItem:button];
    [self.navigationItem setTitle:@"Contatos"];
}

- (void)showContactForm {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"ContactForm"];
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[ContactRepository sharedManager] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return SECTIONS;
}

@end
