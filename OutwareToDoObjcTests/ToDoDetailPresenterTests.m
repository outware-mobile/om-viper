//
//  ToDoDetailPresenterTests.m
//  OutwareToDoObjc
//
//  Created by Jean-Étienne on 26/03/2015.
//  Copyright (c) 2015 Bjorn Juwen Ho. All rights reserved.
//

#import <Kiwi/Kiwi.h>

#import "ToDoDetailPresenter.h"

#import "ToDoDetailViewController.h"
#import "ToDoDetailPresentationModel.h"
#import "ToDoDetailViewModel.h"
#import "ToDoDetailInteractor.h"

SPEC_BEGIN(ToDoDetailPresenterTests)

describe(@"ToDoDetailPresenter", ^{

    context(@"event handling", ^{

        __block ToDoDetailPresenter *presenter;
        __block ToDoDetailInteractor *interactor;

        beforeEach(^{
            interactor = [ToDoDetailInteractor new];
            presenter = [[ToDoDetailPresenter alloc] initWithDismiss:nil];
            presenter.interactor = interactor;
        });

        it(@"should pass the refreshData message to the interactor", ^{
            [[interactor should] receive:@selector(refreshData) withCount:1];

            [presenter refreshData];
        });

        it(@"should call the dismiss block with the user interface as a parameter when dismissed", ^{
            __block UIViewController *userInterface;
            ToDoDetailViewController *detailUserInterface = [ToDoDetailViewController new];
            ToDoDetailPresenter *otherPresenter = [[ToDoDetailPresenter alloc] initWithDismiss:^(id blockUserInterface) {
                userInterface = blockUserInterface;
            }];
            otherPresenter.userInterface = detailUserInterface;

            [otherPresenter dismiss];

            [[userInterface should] equal:detailUserInterface];
        });

    });

    context(@"data refresh", ^{

        __block ToDoDetailPresenter *presenter;
        __block ToDoDetailViewController *userInterface;
        __block ToDoDetailPresentationModel *presentationModel;
        __block KWCaptureSpy *spy;

        beforeEach(^{
            userInterface = [ToDoDetailViewController new];
            presenter = [[ToDoDetailPresenter alloc] initWithDismiss:nil];
            presenter.userInterface = userInterface;

            presentationModel = [ToDoDetailPresentationModel new];
            presentationModel.title = @"title";
            presentationModel.content = @"content";

            spy = [userInterface captureArgument:@selector(displayItem:) atIndex:0];
        });

        it(@"should pass a view model to the view controller", ^{
            [presenter dataAvailable:presentationModel];
            [[spy.argument shouldNot] beNil];
        });

        it(@"should pass a view model with a title", ^{
            [presenter dataAvailable:presentationModel];
            ToDoDetailViewModel *model = spy.argument;
            [[model.title should] equal:presentationModel.title];
        });

        it(@"should pass a view model with a content", ^{
            [presenter dataAvailable:presentationModel];
            ToDoDetailViewModel *model = spy.argument;
            [[model.content should] equal:presentationModel.content];
        });

    });

});

SPEC_END
