//
//  ToDoDetailInteractorTests.m
//  OutwareToDoObjc
//
//  Created by Jean-Étienne on 26/03/2015.
//  Copyright (c) 2015 Bjorn Juwen Ho. All rights reserved.
//

#import <Kiwi/Kiwi.h>

#import "ToDoDetailInteractor.h"

#import "ToDoDetailPresentationModel.h"
#import "ToDoDetailPresenter.h"
#import "ToDoDetailViewModel.h"
#import "ToDoItem.h"
#import "ToDoItemInteractor.h"

SPEC_BEGIN(ToDoDetailInteractorTests)

describe(@"ToDoDetailInteractor", ^{

    context(@"passing a presentation model to the presenter when refreshing the data", ^{

        __block ToDoDetailInteractor *interactor;
        __block ToDoDetailPresenter *presenter;
        __block ToDoItemInteractor *itemInteractor;
        __block ToDoItem *item;

        __block KWCaptureSpy *spy;

        beforeEach(^{
            presenter = [ToDoDetailPresenter new];
            interactor = [ToDoDetailInteractor new];
            interactor.presenter = presenter;
            itemInteractor = [ToDoItemInteractor new];

            item = [ToDoItem new];
            item.title = @"title";
            item.content = @"content";

            [ToDoItemInteractor stub:@selector(sharedInteractor) andReturn:itemInteractor];
            [itemInteractor stub:@selector(itemAtIndex:) andReturn:item];

            spy = [presenter captureArgument:@selector(dataAvailable:) atIndex:0];
        });

        it(@"should pass a presentation model to the presenter", ^{
            [interactor refreshData];

            [[spy.argument shouldNot] beNil];
        });

        it(@"should pass a presentation model with a title", ^{
            [interactor refreshData];
            ToDoDetailPresentationModel *model = spy.argument;

            [[model.title should] equal:item.title];
        });

        it(@"should pass a presentation model with a content", ^{
            [interactor refreshData];
            ToDoDetailPresentationModel *model = spy.argument;

            [[model.content should] equal:item.content];
        });

    });

});

SPEC_END
