//
//  ToDoListInteractorTests.m
//  OutwareToDoObjc
//
//  Created by Akshay Venkatesh on 10/02/2015.
//  Copyright (c) 2015 Bjorn Juwen Ho. All rights reserved.
//

#import <Kiwi/Kiwi.h>

#import "ToDoListInteractor.h"

#import "ToDoListPresenter.h"
#import "ToDoItemInteractor.h"

SPEC_BEGIN(ToDoListInteractorTests)

describe(@"TodoListInteractor", ^{
    __block ToDoListPresenter *presenter;
    __block ToDoListInteractor *interactor;
    
    describe(@"Receiving items", ^{
        it(@"should ask the list interactor for all items", ^{
            presenter = [ToDoListPresenter nullMock];
            interactor = [[ToDoListInteractor alloc] initWithPresenter:presenter];
            
            ToDoItemInteractor *itemInteractor = [ToDoItemInteractor mock];
            [ToDoItemInteractor stub:@selector(sharedInteractor) andReturn:itemInteractor];
            
            [[itemInteractor should] receive:@selector(allItems)];
            [interactor refreshData];
        });
    });
    
    describe(@"Communicating with presenter", ^{
        it(@"should tell the presenter that data is available", ^{
            presenter = [ToDoListPresenter mock];
            interactor = [[ToDoListInteractor alloc] initWithPresenter:presenter];
            
            ToDoItemInteractor *itemInteractor = [ToDoItemInteractor nullMock];
            [ToDoItemInteractor stub:@selector(sharedInteractor) andReturn:itemInteractor];
            
            [[presenter should] receive:@selector(dataAvailable:)];
            [interactor refreshData];
        });
    });
});

SPEC_END
