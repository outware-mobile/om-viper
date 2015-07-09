//
//  ToDoItemInteractor.m
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import "ToDoItemInteractor.h"

@implementation ToDoItemInteractor

+ (instancetype)sharedInteractor
{
    static ToDoItemInteractor* interactor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        interactor = [[ToDoItemInteractor alloc] init];
    });
    return interactor;
}

- (NSArray *)allItems
{
    return [ToDoDataStore sharedStore].items;
}

- (void)addItem:(ToDoItem *)item
{
    if (item) {
        NSMutableArray *items = [NSMutableArray arrayWithArray:[ToDoDataStore sharedStore].items];
        [items addObject:item];
        [ToDoDataStore sharedStore].items = [items copy];
    }
}

- (void)removeItemAtIndex:(NSInteger)index
{
    if (index < [[ToDoDataStore sharedStore].items count]) {
        NSMutableArray *items = [NSMutableArray arrayWithArray:[ToDoDataStore sharedStore].items];
        [items removeObjectAtIndex:index];
        [ToDoDataStore sharedStore].items = [items copy];
    }
}

- (ToDoItem *)itemAtIndex:(NSInteger)index
{
    return index < [[ToDoDataStore sharedStore].items count] ? [ToDoDataStore sharedStore].items[index] : nil;
}

@end
