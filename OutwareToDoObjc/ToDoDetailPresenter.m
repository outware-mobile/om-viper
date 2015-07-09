//
//  ToDoDetailPresenter.m
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import "ToDoDetailPresenter.h"

#import "ToDoDetailInteractor.h"
#import "ToDoDetailViewModel.h"

@interface ToDoDetailPresenter()

@property (nonatomic, copy) void (^dismissBlock)(id userInterface);

@end



@implementation ToDoDetailPresenter

- (instancetype)initWithDismiss:(void (^)(id userInterface))dismissBlock
{
    self = [super init];
    if (self) {
        _dismissBlock = dismissBlock;
    }
    return self;
}

- (void)dismiss
{
    self.dismissBlock(self.userInterface);
}

- (void)refreshData
{
    [self.interactor refreshData];
}

- (void)dataAvailable:(ToDoDetailPresentationModel *)item
{
    ToDoDetailViewModel *viewModel = [[ToDoDetailViewModel alloc] init];
    viewModel.title = item.title;
    viewModel.content = item.content;

    [self.userInterface displayItem:viewModel];
}

@end
