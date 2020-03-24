//
//  MasonryListTableViewController.m
//  sample
//
//  Created by ysnows on 2020/3/21.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MasonryListTableViewController.h"

#import "MasonryExampleViewController.h"
#import "MasonryBasicView.h"
#import "MasonryremakeView.h"
#import "MasonryConstantsView.h"
#import "MasonrySidesView.h"
#import "MasonryAspectView.h"
#import "MasonryBasicAnimatedView.h"
#import "MasonryScrollView.h"
#import "MasonryArrView.h"
#import "MasonryMarginView.h"
#import "MasonryDistributeView.h"


@interface MasonryListTableViewController ()
@property(nonatomic, strong) NSArray *exampleControllerArr;

@end

@implementation MasonryListTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title=@"Examples";
        _exampleControllerArr=@[
            [[MasonryExampleViewController alloc] initWithTitle:@"BasicView" andClass:[MasonryBasicView class]],
            [[MasonryExampleViewController alloc] initWithTitle:@"RemakeView" andClass:[MasonryremakeView class]],
            [[MasonryExampleViewController alloc] initWithTitle:@"ConstantsView" andClass:[MasonryConstantsView class]],
            [[MasonryExampleViewController alloc] initWithTitle:@"SidesView" andClass:[MasonrySidesView class]],
            [[MasonryExampleViewController alloc] initWithTitle:@"Aspect" andClass:[MasonryAspectView class]],
            [[MasonryExampleViewController alloc] initWithTitle:@"Basic Animated" andClass:[MasonryBasicAnimatedView class]],
            [[MasonryExampleViewController alloc] initWithTitle:@"ScrollView" andClass:[MasonryScrollView class]],
            [[MasonryExampleViewController alloc] initWithTitle:@"ArrayView" andClass:[MasonryArrView class]],
            [[MasonryExampleViewController alloc] initWithTitle:@"MarginView" andClass:[MasonryMarginView class]],
            [[MasonryExampleViewController alloc] initWithTitle:@"DistributeView" andClass:[MasonryDistributeView class]]
            
        ];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [_exampleControllerArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    UIViewController *controller= _exampleControllerArr[indexPath.row];
    cell.textLabel.text=controller.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:_exampleControllerArr[indexPath.row] animated:YES];
}

@end
