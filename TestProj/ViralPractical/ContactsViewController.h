//
//  ContactsViewController.h
//  ViralPractical
//
//  Created by Viral Narshana on 11/3/17.
//  Copyright © 2017 ISM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/ABAddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ContactsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (nonatomic,strong)NSMutableArray *arrTempContacts;
@property (nonatomic,strong) IBOutlet UITableView *tblMain;
@property (nonatomic,strong) IBOutlet UISearchBar *searchbar;
@property (nonatomic,strong)NSMutableArray *arrAllContacts;
@end
