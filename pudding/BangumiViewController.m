//
//  BangumiViewController.m
//  
//
//  Created by customer on 15/9/27.
//
//

#import "BangumiViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "WEICollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "JSONModel.h"
#import "DataManager.h"
#import "AFNetworking.h"
#import "DIENotificationConfig.h"

@interface BangumiViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
{
    UICollectionView *_collectionView;
//    NSArray *_modelArray;
}
@end

@implementation BangumiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionViewInit];
    DIEAddObserver(self, @selector(didUpdate:), kDIECategoryUpdateNotif, nil);
    [[DataManager sharedManager]updateCategory];
}

- (void)didUpdate:(id)sender{
    [_collectionView reloadData];
}

- (void)collectionViewInit{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize = CGSizeMake(80,100);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset = UIEdgeInsetsMake(74, 10, 60, 10);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[WEICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return _modelArray.count;
    return [[DataManager sharedManager].categoriesArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WEICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    [cell.imageView sd_setImageWithURL:[_modelArray[indexPath.item] url]];
    [cell.imageView sd_setImageWithURL:[[DataManager sharedManager].categoriesArray[indexPath.item] url]];
    //    cell.maskLabel.text = [_modelArray[indexPath.item] name];
    
    cell.maskLabel.text = [[DataManager sharedManager].categoriesArray[indexPath.item] name];
    return cell;
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

@end
