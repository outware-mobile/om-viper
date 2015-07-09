//
//  ToDoItemInteractor.h
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoDataStore.h"

/**
 *  The interactor for the to do items. Handles all the logic for CRUD operations
 *  on the list of to do items
 */
@interface ToDoItemInteractor : NSObject

/**
 *  Method to get the singleton instance of the to do interactor
 *  @return The singleton instance of the interactor
 */
+ (instancetype)sharedInteractor;

/** 
 *  Method to get all the to do items
 *  @return The list of all the to do items
 */
- (NSArray *)allItems;

/**
 *  Method to add a new to do item
 *  @param item The new to do item to be added to the list
 */
- (void)addItem:(ToDoItem *)item;

/**
 *  Method to remove a to do item at an index
 *  @param index The index to remove the to do item
 */
- (void)removeItemAtIndex:(NSInteger)index;

/**
 *  Method to get an item given an index
 *  @param index The index to get the to do item
 *  @return The to do item retrieved
 */
- (ToDoItem *)itemAtIndex:(NSInteger)index;

@end
