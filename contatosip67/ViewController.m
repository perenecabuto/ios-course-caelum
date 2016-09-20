//
//  ViewController.m
//  contatosip67
//
//  Created by ios6246 on 19/09/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import "ViewController.h"
#import "ContactFormViewController.h"
@import UIKit;


@implementation ViewController

- (void)viewDidLoad {
    [self.input addTarget:self action:@selector(textViewDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClick:(id)sender {
    NSLog(@"%@", self.input.text);
}

- (void)textViewDidChange:(UITextView *)textView {
    NSDictionary* validColors = @{
                                  @"blue": [UIColor blueColor],
                                  @"red": [UIColor redColor],
                                  @"green": [UIColor greenColor],
                                  };
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NSString* value = textView.text;
    UIViewController* vc;
    if ([value isEqualToString:@"form"]) {
        vc = [storyboard instantiateViewControllerWithIdentifier:@"ContactForm"];
    } else if ([value isEqualToString:@"list"]) {
        vc = [storyboard instantiateViewControllerWithIdentifier:@"ContactList"];
    }

    if (vc) {
        [self presentViewController:vc animated:TRUE completion:nil];
        return;
    }
    
    self.debug.text = value;
    UIColor* color = [validColors valueForKey:textView.text];
    if (color) {
        self.debug.textColor = color;
    } else {
        self.debug.textColor = [UIColor blackColor];
    }
}

@end
