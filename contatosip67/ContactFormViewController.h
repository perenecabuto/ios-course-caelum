//
//  ContactFormViewController.h
//  contatosip67
//
//  Created by ios6246 on 19/09/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactFormViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (weak, nonatomic) IBOutlet UILabel *debug;

@end
