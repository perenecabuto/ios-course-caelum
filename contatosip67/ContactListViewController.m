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
#import "ContactMenuManager.h"


@implementation ContactListViewController

const NSInteger SECTIONS = 1;

# pragma UIViewControllerDelegate methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILongPressGestureRecognizer* click =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(openMenu:)];
    [self.tableView addGestureRecognizer:click];
    
    UIBarButtonItem* addButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                  target:self
                                                  action:@selector(showContactForm)];
    
    UIBarButtonItem* delButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                  target:self
                                                  action:@selector(toggleEdition)];
    
    [self.navigationItem setRightBarButtonItem:addButton];
    [self.navigationItem setLeftBarButtonItem:delButton];
    [self.navigationItem setTitle:@"Contatos"];
    
    self.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Lista" image:[UIImage imageNamed:@"list.png"] tag: 0];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView setEditing:NO];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    if (_selectedContact) {
        NSInteger id_ = [[ContactRepository sharedManager] getContactID:_selectedContact];
        NSIndexPath* path = [NSIndexPath indexPathForItem:id_ inSection:0];
//        [self.tableView selectRowAtIndexPath:path animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        _selectedContact = nil;
    }
}

# pragma button callbacks

- (void)toggleEdition {
    [self.tableView setEditing:!self.tableView.isEditing];
}

- (void)showContactForm {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"ContactForm"];
    if ([vc isKindOfClass:[ContactFormViewController class]]) {
        ((ContactFormViewController *)vc).delegate = self;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)openMenu:(UIGestureRecognizer*)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint p = [gesture locationInView:self.tableView];
        NSIndexPath* path = [self.tableView indexPathForRowAtPoint:p];
        if (path) {
            Contact* c = [[ContactRepository sharedManager] contactByID:path.row];
            _menu = [[ContactMenuManager alloc] initWithContact:c];
            [_menu showInView:self.view];
        }
    }
}

# pragma UITableViewDelegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[ContactRepository sharedManager] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return SECTIONS;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Contact* c = [[ContactRepository sharedManager] contactByID:indexPath.row];
        [[ContactRepository sharedManager] remove:c];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Contact* c = [[ContactRepository sharedManager]contactByID:indexPath.row];
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text = c.name;
    cell.imageView.image = c.photo;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - <%@>", c.phone, c.email];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedContact = [[ContactRepository sharedManager] contactByID:indexPath.row];
    [self showContactForm];
}

# pragma ContactFormViewControllerDelegate methods

- (void)hightlightContact:(Contact *)contact {
    _selectedContact = contact;
}

- (Contact *)selectedConctact {
    return _selectedContact;
}

@end
