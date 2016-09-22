//
//  ContactMenuManager.h
//  contatosip67
//
//  Created by ios6246 on 9/22/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Contact.h"

@interface ContactMenuManager : NSObject<UIActionSheetDelegate>

@property (nonatomic, weak) Contact* contact;

- (id)initWithContact:(Contact*)contact;

- (void)showInView:(UIView*)view;

@end
