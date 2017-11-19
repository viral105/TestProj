//
//  HomeViewController.m
//  ViralPractical
//
//  Created by Viral Narshana on 11/3/17.
//  Copyright © 2017 ISM. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    
    
    // Do any additional setup after loading the view.
    self.objPhotosVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotosViewController"];
    [self addChildViewController:self.objPhotosVC];
    [self.objPhotosVC.view setFrame:CGRectMake(0.0f, 0.0f, self.viewSub.frame.size.width, self.viewSub.frame.size.height)];
    [self.viewSub addSubview:self.objPhotosVC.view];
    [self.objPhotosVC didMoveToParentViewController:self];

    self.objContactsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactsViewController"];
    [self addChildViewController:self.objContactsVC];
    [self.objContactsVC.view setFrame:CGRectMake(0.0f, 0.0f, self.viewSub.frame.size.width, self.viewSub.frame.size.height)];
    [self.viewSub addSubview:self.objContactsVC.view];
    NSLog(@"arrContacts.count %d",(int)self.objContactsVC.arrAllContacts.count);
    [self.objContactsVC.tblMain reloadData];
    [self.objContactsVC didMoveToParentViewController:self];
    
    [self.viewSub bringSubviewToFront:self.objContactsVC.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)segControllChange:(UISegmentedControl*)sender{
    if (sender.selectedSegmentIndex == 0) {
        [self.viewSub bringSubviewToFront:self.objContactsVC.view];
    }
    else{
        [self.objPhotosVC.cvMain reloadData];
        [self.viewSub bringSubviewToFront:self.objPhotosVC.view];
    }
}
-(IBAction)btnLogout_Clicked:(UIButton*)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
