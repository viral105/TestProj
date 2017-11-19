//
//  PhotosViewController.h
//  ViralPractical
//
//  Created by Viral Narshana on 11/3/17.
//  Copyright © 2017 ISM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "JTSImageViewController.h"
#import "JTSImageInfo.h"

@interface PhotosViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) PHFetchResult *assetsFetchResults;
@property(nonatomic,strong) PHCachingImageManager *imageManager;
@property(nonatomic,strong) IBOutlet UICollectionView *cvMain;
@end
