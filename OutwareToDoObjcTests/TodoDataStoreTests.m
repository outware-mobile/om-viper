//
//  ToDoDataStoreTests.m
//  OutwareToDoObjc
//
//  Created by Akshay Venkatesh on 10/02/2015.
//  Copyright (c) 2015 Bjorn Juwen Ho. All rights reserved.
//

#import <Kiwi/Kiwi.h>

#import "ToDoDataStore.h"

SPEC_BEGIN(ToDoDataStoreTests)

describe(@"ToDoDataStore", ^{

    beforeEach(^{
        ToDoDataStore *dataStore = [ToDoDataStore new];
        [ToDoDataStore stub:@selector(sharedStore) andReturn:dataStore];
    });
    
    it(@"should be initialised with no items", ^{
        [[[[ToDoDataStore sharedStore] items] shouldNot] beNil];
    });
    
    it(@"should have 3 items", ^{
        [[[[ToDoDataStore sharedStore] should] have:3] items];
    });
    
});

SPEC_END
