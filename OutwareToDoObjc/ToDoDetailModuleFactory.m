//
//  ToDoDetailModuleFactory.m
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import "ToDoDetailModuleFactory.h"
#import "ToDoDetailPresenter.h"
#import "ToDoDetailInteractor.h"
#import "ToDoDetailViewController.h"

@implementation ToDoDetailModuleFactory

+ (UIViewController *)createModuleWithItem:(NSInteger)itemIndex withDismiss:(void (^)(id))dismissBlock
{
    ToDoDetailInteractor *interactor = [[ToDoDetailInteractor alloc] init];
    ToDoDetailPresenter *presenter = [[ToDoDetailPresenter alloc] initWithDismiss:dismissBlock];
    ToDoDetailViewController *viewController = [[ToDoDetailViewController alloc] initWithNibName:@"ToDoDetailViewController" bundle:[NSBundle mainBundle]];

    interactor.presenter = presenter;
    interactor.indexToRetrieve = itemIndex;
    presenter.userInterface = viewController;
    presenter.interactor = interactor;
    viewController.handler = presenter;

    return viewController;
}

@end
