//
//  FirstViewController.h
//  MacysExample
//
//  Created by Daniel Stewart on 2/7/14.
//  Copyright (c) 2014 Daniel Stewart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DestinationViewController.h"
#import "HomeOptionsCell.h"
#import "AdvertisementsCell.h"

@interface FirstViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate>

@property (strong, nonatomic) UIImageView *welcomeImage;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewHomePage;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBarHomePage;

- (IBAction)buttonScanAction:(UIButton *)sender;

@end
