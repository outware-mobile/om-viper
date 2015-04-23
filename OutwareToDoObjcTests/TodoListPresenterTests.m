//
//  ToDoListPresenterTests.m
//  OutwareToDoObjc
//
//  Created by Akshay Venkatesh on 10/02/2015.
//  Copyright (c) 2015 Bjorn Juwen Ho. All rights reserved.
//

#import <Kiwi/Kiwi.h>

#import "ToDoListPresenter.h"

#import "ToDoListViewModel.h"
#import "ToDoListInteractor.h"
#import "ToDoListUserInterface.h"
#import "ToDoItem.h"

SPEC_BEGIN(ToDoListPresenterTests)

describe(@"ToDoListPresenter", ^{
    
    __block ToDoListPresenter *presenter;
    
    describe(@"Data Refresh", ^{
        it(@"should pass on the refresh call to the interactor", ^{
            id<ToDoListUserInterface> userInterface = [KWMock nullMockForProtocol:@protocol(ToDoListUserInterface)];
            ToDoListInteractor *interactor = [ToDoListInteractor mock];
            ToDoListRouter *router = [ToDoListRouter nullMock];
            presenter = [[ToDoListPresenter alloc] initWithUserInterface:userInterface interactor:interactor router:router];
            
            [[interactor should] receive:@selector(refreshData)];
            
            [presenter refreshData];
        });
    });
    
    describe(@"Item selection", ^{
        
        pending(@"should inform the router on item selection", ^{
        });
        
        pending(@"should transfer the item at the selected index to the router", ^{
        });
        
        
    });
    
    describe(@"On data availability", ^{
        
        it(@"should prepare a view model of the data received", ^{
            NSObject<ToDoListUserInterface> *userInterface = [KWMock nullMockForProtocol:@protocol(ToDoListUserInterface)];
            ToDoListInteractor *interactor = [ToDoListInteractor mock];
            ToDoListRouter *router = [ToDoListRouter mock];
            presenter = [[ToDoListPresenter alloc] initWithUserInterface:userInterface interactor:interactor router:router];
            
            NSMutableArray *array = @[].mutableCopy;
            ToDoItem *item1 = [[ToDoItem alloc] init];
            item1.title = @"SPAM";
            item1.content = @"spam";
            [array addObject:item1];
            
            item1 = [[ToDoItem alloc] init];
            item1.title = @"HAM";
            item1.content = @"ham";
            [array addObject:item1];
            
            item1 = [[ToDoItem alloc] init];
            item1.title = @"EGGS";
            item1.content = @"eggs";
            [array addObject:item1];
            
            [[userInterface should] receive:@selector(displayItems:)];
            KWCaptureSpy *spy = [userInterface captureArgument:@selector(displayItems:) atIndex:0];
            
            [presenter dataAvailable:array];
            
            ToDoListViewModel *viewmodel = spy.argument;
            [[viewmodel.items should] haveCountOf:3];
            [[viewmodel.items should] containObjectsInArray:@[@"SPAM", @"HAM", @"EGGS"]];
        });
    });
    
});

SPEC_END
