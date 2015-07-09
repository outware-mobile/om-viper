//
//  ToDoListPresenter.m
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import "ToDoListPresenter.h"
#import "ToDoListViewModel.h"
#import "ToDoListInteractor.h"

@implementation ToDoListPresenter

- (instancetype)initWithUserInterface:(id<ToDoListUserInterface>)userInterface interactor:(ToDoListInteractor *)interactor router:(ToDoListRouter *)router
{
    self = [super init];
    if (self) {
        _userInterface = userInterface;
        _interactor = interactor;
        _router = router;
    }
    return self;
}

- (void)didSelectItemAtIndex:(NSInteger)index
{
    UIViewController *detailVC = [self.router detailViewControllerForItemAtIndex:index withDismiss:^(UIViewController* vc) {
        [self.userInterface dismissDetailViewController:vc];
    }];
    
    [self.userInterface transitionToDetailViewController:detailVC];
}

- (void)didSelectNewItem
{
    
}

- (void)refreshData
{
    [self.interactor refreshData];
}

- (void)dataAvailable:(NSArray *)items
{
    ToDoListViewModel *viewModel = [[ToDoListViewModel alloc] init];
    viewModel.items = [items valueForKey:@"title"];
    [self.userInterface displayItems:viewModel];
}

@end
