//
//  ToDoListRouterTests.m
//  OutwareToDoObjc
//
//  Created by Jean-Étienne on 26/03/2015.
//  Copyright (c) 2015 Bjorn Juwen Ho. All rights reserved.
//

#import <Kiwi/Kiwi.h>

#import "ToDoListRouter.h"

#import "ToDoDetailModuleFactory.h"

SPEC_BEGIN(ToDoListRouterTests)

describe(@"ToDoListRouter", ^{

    context(@"routing to a detail module", ^{

        it(@"should return a detail module view controller", ^{
            UIViewController *detailViewController = [[ToDoListRouter new] detailViewControllerForItemAtIndex:0 withDismiss:nil];
            [[detailViewController shouldNot] beNil];
        });

        it(@"should call the detail module factory with the same arguments", ^{
            NSInteger itemIndex = 0;
            void(^dismissBlock)(id userInterface) = ^void(id userInterface) {};

            [[ToDoDetailModuleFactory should] receive:@selector(createModuleWithItem:withDismiss:) withArguments:theValue(itemIndex), dismissBlock];

            [[ToDoListRouter new] detailViewControllerForItemAtIndex:itemIndex withDismiss:dismissBlock];
        });

    });

});

SPEC_END
