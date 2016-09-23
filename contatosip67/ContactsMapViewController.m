//
//  ContactsMapViewController.m
//  contatosip67
//
//  Created by ios6246 on 9/22/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import "ContactsMapViewController.h"
#import "ContactRepository.h"


@implementation ContactsMapViewController

- (void)viewDidLoad {
    self.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Mapa" image:[UIImage imageNamed:@"map.png"] tag: 0];
    
    MKUserTrackingBarButtonItem* gpsButton = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.map];
    [self.navigationItem setRightBarButtonItem:gpsButton];
    
    [[CLLocationManager new] requestAlwaysAuthorization];
}

- (void)viewWillAppear:(BOOL)animated {
    NSArray<id<MKAnnotation>> *contatos = [[ContactRepository sharedManager] listAll];
    [_map addAnnotations:contatos];
}

- (void)viewDidDisappear:(BOOL)animated {
    [_map removeAnnotations:_map.annotations];
}

@end
