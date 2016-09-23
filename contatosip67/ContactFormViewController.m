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
        _image.image = contact.photo;
    }
    
    [self.navigationItem setRightBarButtonItem:button];
}

- (void)updateContact:(id)sender {
    if (!self.delegate || ![self.delegate selectedConctact]) {
        return;
    }
    
    Contact* c = [self contactFromFields];
    NSInteger id_ = [[ContactRepository sharedManager] getContactID:[self.delegate selectedConctact]];
    [[ContactRepository sharedManager] update:c byID:id_];
    [self.delegate hightlightContact:c];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addContact:(id)sender {
    Contact* c = [self contactFromFields];
    [[ContactRepository sharedManager] add:c];
    [self.delegate hightlightContact:c];
    [self.navigationController popViewControllerAnimated:YES];
}

- (Contact *) contactFromFields {
    Contact* c = [[Contact alloc]
            initWithName:_name.text phone:_phone.text email:_email.text address:_address.text site:_site.text photo:_image.image];
    if (CLLocationCoordinate2DIsValid(_addressCoords)) {
        [c setCoords:_addressCoords];
    }
    return c;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage* selectedImage = [info valueForKey:UIImagePickerControllerEditedImage];
    [_image setImage:selectedImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)openImage:(id)sender {
    UIImagePickerController* picker = [UIImagePickerController new];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = YES;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

}

@end
