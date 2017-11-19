//
//  HomeViewController.h
//  ViralPractical
//
//  Created by Viral Narshana on 11/3/17.
//  Copyright © 2017 ISM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactsViewController.h"
#import "PhotosViewController.h"
#import <AddressBook/ABAddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <Photos/Photos.h>

@interface HomeViewController : UIViewController

@property (nonatomic,strong) ContactsViewController *objContactsVC;
@property (nonatomic,strong) PhotosViewController *objPhotosVC;
@property (nonatomic,strong) IBOutlet UIView *viewSub;

@end
