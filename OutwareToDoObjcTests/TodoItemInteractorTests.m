//
//  ToDoItemInteractorTests.m
//  OutwareToDoObjc
//
//  Created by Akshay Venkatesh on 10/02/2015.
//  Copyright (c) 2015 Bjorn Juwen Ho. All rights reserved.
//

#import <Kiwi/Kiwi.h>

#import "ToDoItemInteractor.h"

#import "ToDoDataStore.h"

SPEC_BEGIN(ToDoItemInteractorTests)

describe(@"ToDoItemInteractor", ^{
    __block ToDoDataStore *dataStore;
    __block ToDoItemInteractor *interactor;
    
    beforeEach(^{
        dataStore = [ToDoDataStore new];
        [ToDoDataStore stub:@selector(sharedStore) andReturn:dataStore];
        
        interactor = [ToDoItemInteractor new];
        [ToDoItemInteractor stub:@selector(sharedInteractor) andReturn:interactor];
    });
    
    it(@"all items should ask the data store for items", ^{
        [[dataStore should] receive:@selector(items)];
        [interactor allItems];
    });
    
    
    describe(@"Add Item", ^{
        
        it(@"should modify items in the store", ^{
            [[dataStore should] receive:@selector(items)];
            [interactor allItems];
        });
        
        it(@"should add an item to the store", ^{
            dataStore.items = @[];
            KWCaptureSpy *spy = [dataStore captureArgument:@selector(setItems:) atIndex:0];
            
            ToDoItem *anItem = [ToDoItem new];
            [interactor addItem:anItem];
            
            NSArray *items = spy.argument;
            [[items should] contain:anItem];
            [[theValue(items.count) should] equal:theValue(1)];
        });
        
        it(@"should add multiple items to the store", ^{
            dataStore.items = @[];
            
            ToDoItem *anItem1 = [ToDoItem new];
            [interactor addItem:anItem1];
            
            ToDoItem *anItem2 = [ToDoItem new];
            [interactor addItem:anItem2];
            
            [[dataStore.items should] contain:anItem1];
            [[dataStore.items should] contain:anItem2];
            
            
            [[theValue(dataStore.items.count) should] equal:theValue(2)];
        });
        
        it(@"should not add a nil item", ^{
            dataStore.items = @[];
            
            [[theBlock(^{ [interactor addItem:nil]; }) shouldNot] raise];
            
        });

    });
    
    
    describe(@"Item At Index", ^{
        
        it(@"should add an item to the store", ^{
            dataStore.items = @[];
            
            ToDoItem *anItem1 = [ToDoItem new];
            [interactor addItem:anItem1];
            
            ToDoItem *anItem2 = [ToDoItem new];
            [interactor addItem:anItem2];
            
            [[dataStore.items should] contain:anItem1];
            [[dataStore.items should] contain:anItem2];
            
            [[[interactor itemAtIndex:1] shouldNot] equal:anItem1];
            [[[interactor itemAtIndex:1] should] equal:anItem2];
        });
        
        it(@"should return a nil item at an invalid index", ^{
            dataStore.items = @[];
            
            [[theBlock(^{ [interactor itemAtIndex:0]; }) shouldNot] raise];
            
        });
    });
    
    describe(@"Remove item At index", ^{
        
        it(@"should remove an item from the store", ^{
            dataStore.items = @[];
            
            ToDoItem *anItem1 = [ToDoItem new];
            [interactor addItem:anItem1];
            
            ToDoItem *anItem2 = [ToDoItem new];
            [interactor addItem:anItem2];
            
            [[dataStore.items should] haveCountOf:2];
            [[dataStore.items should] contain:anItem1];
            [[dataStore.items should] contain:anItem2];
            
            [interactor removeItemAtIndex:1];
            
            [[dataStore.items should] haveCountOf:1];
            [[dataStore.items should] contain:anItem1];
            [[dataStore.items shouldNot] contain:anItem2];
            [[[interactor itemAtIndex:0] should] equal:anItem1];
        });
        
        it(@"removing an item at an invalid index should fail gracefully", ^{
            dataStore.items = @[];
            
            [[theBlock(^{ [interactor removeItemAtIndex:0]; }) shouldNot] raise];
            
        });
    });
    
});

SPEC_END
