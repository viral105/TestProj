//
//  PhotosViewController.m
//  ViralPractical
//
//  Created by Viral Narshana on 11/3/17.
//  Copyright © 2017 ISM. All rights reserved.
//

#import "PhotosViewController.h"

@interface PhotosViewController ()

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    
    if (status == PHAuthorizationStatusAuthorized) {
        // Access has been granted.
        PHFetchOptions *options = [[PHFetchOptions alloc] init];
        options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
        _assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
        
        _imageManager = [[PHCachingImageManager alloc] init];
    }
    
    else if (status == PHAuthorizationStatusDenied) {
        // Access has been denied.
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Photos access has been denied.Go settings -> Privacy to allow access." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    else if (status == PHAuthorizationStatusNotDetermined) {
        
        // Access has not been determined.
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            
            if (status == PHAuthorizationStatusAuthorized) {
                // Access has been granted.
                PHFetchOptions *options = [[PHFetchOptions alloc] init];
                options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
                _assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
                
                _imageManager = [[PHCachingImageManager alloc] init];
            }
            
            else {
                // Access has been denied.
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Photos access has been denied.Go settings -> Privacy to allow access." preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }
        }];
    }
    
    
    
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
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_assetsFetchResults count];
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:101];
    PHAsset *asset = _assetsFetchResults[indexPath.item];
    
    [_imageManager requestImageForAsset:asset targetSize:CGSizeMake((self.cvMain.frame.size.width-30)/2,(self.cvMain.frame.size.width-30)/2) contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage *result, NSDictionary *info)
     {
         imageView.image = result;
     }];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.cvMain.frame.size.width-30)/2,(self.cvMain.frame.size.width-30)/2);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.cvMain cellForItemAtIndexPath:indexPath];
    
    PHAsset *asset = _assetsFetchResults[indexPath.item];
    
    [_imageManager requestImageForAsset:asset targetSize:CGSizeMake(300, 400) contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage *result, NSDictionary *info)
     {
         // result is the actual image object.
         JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
         imageInfo.image = result;
         imageInfo.referenceRect = cell.contentView.frame;
         imageInfo.referenceView = cell.contentView;
         imageInfo.referenceContentMode = cell.contentView.contentMode;
//         imageInfo.referenceCornerRadius = self.bigImageButton.layer.cornerRadius;
         
         // Setup view controller
         JTSImageViewController *imageViewer = [[JTSImageViewController alloc]
                                                initWithImageInfo:imageInfo
                                                mode:JTSImageViewControllerMode_Image
                                                backgroundStyle:JTSImageViewControllerBackgroundOption_None];
         
         // Present the view controller.
         [imageViewer showFromViewController:self transition:JTSImageViewControllerTransition_FromOriginalPosition];
     }];
}
@end
