//
//  FirstViewController.m
//  MacysExample
//
//  Created by Daniel Stewart on 2/7/14.
//  Copyright (c) 2014 Daniel Stewart. All rights reserved.
//

#import "FirstViewController.h"

//Determines which custom CollectionCell will be used
#define homeOptionsLowIndex 1
#define homeOptionsHighIndex homeOptionsLowIndex + 5

@interface FirstViewController () {
    
    NSArray *homeOptionImages;
    NSArray *advertisementImages;
    int currentTapCount;
    NSString *searchString;
}
@end

@implementation FirstViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    //Set up the welcomeImage
    self.welcomeImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"welcomeScreen.jpeg"]];
    self.welcomeImage.frame = self.view.bounds;
    self.welcomeImage.userInteractionEnabled = YES;
    
    //Set up UITapGestureRecognizer and set it to the welcomeImage
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissWelcomeImage)];
    tapGesture.numberOfTapsRequired = 1;
    [self.welcomeImage addGestureRecognizer:tapGesture];
    
    [self.view addSubview:self.welcomeImage];
    
    currentTapCount = 0;
    
    //Set up the arrays that contain each set of images
    homeOptionImages = [[NSArray alloc]initWithObjects:@"macysShopImage.png", @"macysRegistryImage.png",@"macysStores.png", @"macysBagImage.png", @"macysOffersImage.png", @"macysAccountImage.png",nil];
    
    advertisementImages = [[NSArray alloc]initWithObjects:@"bedBathAdImage.jpg", @"impulseAdImage.jpg", @"fashionAdImage.png", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark Handle Gestures

//Simple animation sets alpha of welcomeImage to 0 and then removes from superView
-(void)dismissWelcomeImage {
    
    //Animate the welcomeImage by reducing alpha to 0
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.welcomeImage.alpha = 0.0;
    }completion:^(BOOL finished){
        [self.welcomeImage removeFromSuperview];
    }];
}

#pragma mark - CollectionView DataSource & Delegate Methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//Total number of cells is the total number of images in both arrays
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [homeOptionImages count] + [advertisementImages count];
}

//Set up each cell to the proper image
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //Determine whether we need to display options or ad cells
    if ( indexPath.row >= homeOptionsLowIndex && indexPath.row <= homeOptionsHighIndex )
    {
        //Display HomeOptionsCell
        HomeOptionsCell *homeOptionsCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeOptionsCell" forIndexPath:indexPath];
        homeOptionsCell.cellImage.image = [UIImage imageNamed:[homeOptionImages objectAtIndex:indexPath.row - homeOptionsLowIndex]];
        return  homeOptionsCell;
    }
    
    else {
        //Display AdvertisementsCell
        AdvertisementsCell *adsCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AdvertisementsCell" forIndexPath:indexPath];
        
        if( indexPath.row < homeOptionsLowIndex ) {
            adsCell.cellImage.image = [UIImage imageNamed:[advertisementImages objectAtIndex:indexPath.row]];
        }
        else if( indexPath.row > homeOptionsHighIndex ) {
            int row = (int)indexPath.row;
            int upper = homeOptionsHighIndex;
            adsCell.cellImage.image = [UIImage imageNamed:[advertisementImages objectAtIndex:row - upper]];
        }
        
        return adsCell;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self presentDestinationViewController];
}

//Sets the size of each custom CollectionViewCell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //HomeOptionsCell size
    if ( indexPath.row >= homeOptionsLowIndex && indexPath.row <= homeOptionsHighIndex) {
        return CGSizeMake(100, 100);
    }
    //AdvertisementsCellSize
    else {
        return CGSizeMake(310, 100);
    }
}

#pragma - mark IB Methods
- (IBAction)buttonScanAction:(UIButton *)sender {
    [self presentDestinationViewController];
}

#pragma - mark SearchBar Delegate Methods
-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
    if(searchBar.text.length > 0)
        [self presentDestinationViewController];
    
    return YES;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self presentDestinationViewController];
}

#pragma - mark Service Methods
//Transitions to DestinationViewController
-(void)presentDestinationViewController {
    
    currentTapCount++;
    DestinationViewController *destination = [[DestinationViewController alloc] init];
    destination.resultsOutput = [NSString stringWithFormat:@"%d", currentTapCount];
    self.searchBarHomePage.text = @"";
    [self presentViewController:destination animated:YES completion:nil];
}

@end
