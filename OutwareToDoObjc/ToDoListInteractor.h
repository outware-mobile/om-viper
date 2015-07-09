//
//  ToDoListInteractor.h
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoListPresenter.h"

@interface ToDoListInteractor : NSObject

/**
 *  The to do list interactor. Responsible for retrieving all the to do items
 */
@property (nonatomic, weak) ToDoListPresenter *presenter;

/**
 *  Method to initialise the interactor with the presenter
 *  @param presenter The presenter to send updates that it has information to display
 *  @return The initialised instance
 */
- (instancetype)initWithPresenter:(ToDoListPresenter*)presenter;

/**
 *  Method to refresh its data
 */
- (void)refreshData;

@end
