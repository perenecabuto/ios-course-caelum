//
//  ContactFormViewController.h
//  contatosip67
//
//  Created by ios6246 on 19/09/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@protocol ContactFormViewControllerDelegate <NSObject>

- (Contact*)selectedConctact;
- (void)hightlightContact:(Contact*)contact;

@end


@interface ContactFormViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView* image;
@property (weak, nonatomic) IBOutlet UITextField* name;
@property (weak, nonatomic) IBOutlet UITextField* phone;
@property (weak, nonatomic) IBOutlet UITextField* email;
@property (weak, nonatomic) IBOutlet UITextField* address;
@property (weak, nonatomic) IBOutlet UITextField* site;

@property (weak, nonatomic) IBOutlet UILabel *lonLatDebug;
@property (weak, nonatomic) IBOutlet UIButton *findAddressButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *findAddressLoading;


@property (weak, nonatomic) id<ContactFormViewControllerDelegate> delegate;

- (IBAction)openImage:(id)sender;
- (IBAction)findAddressPosition:(id)sender;

@end
