//
//  ToDoListModuleFactory.m
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import "ToDoListModuleFactory.h"
#import "ToDoListViewController.h"
#import "ToDoListPresenter.h"
#import "ToDoListInteractor.h"
#import "ToDoListRouter.h"

@implementation ToDoListModuleFactory

+ (UIViewController *)createModule
{
    ToDoListRouter *router = [[ToDoListRouter alloc] init];
    ToDoListInteractor *interactor = [[ToDoListInteractor alloc] initWithPresenter:nil];
    ToDoListPresenter *presenter = [[ToDoListPresenter alloc] initWithUserInterface:nil interactor:interactor router:router];
    ToDoListViewController *viewController = [[ToDoListViewController alloc] initWithHandler:presenter];

    presenter.userInterface = viewController;
    interactor.presenter = presenter;

    return viewController;
}

@end
