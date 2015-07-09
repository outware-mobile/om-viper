//
//  ToDoListPresenter.h
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoListEventHandler.h"
#import "ToDoListUserInterface.h"
#import "ToDoListRouter.h"

@class ToDoListInteractor;

/**
 *  The to do list presenter. Responsible for preparing data for the user interface to consume, in order
 *  to display the data
 */
@interface ToDoListPresenter : NSObject <ToDoListEventHandler>

/** The router responsible for navigating to the next screen */
@property (nonatomic, strong) ToDoListRouter *router;

/** The interactor for the to do list screen */
@property (nonatomic, strong) ToDoListInteractor *interactor;

/** The user interface to send display updates to */
@property (nonatomic, weak) id<ToDoListUserInterface> userInterface;

/**
 *  Method to initialise the interactor
 *  @param userInterface The user interface to send display updates to
 *  @param interactor The interactor that will fetch the data
 *  @param router The router that will be used to navigate to the next screen
 */
- (instancetype)initWithUserInterface:(id<ToDoListUserInterface>)userInterface
                           interactor:(ToDoListInteractor *)interactor
                               router:(ToDoListRouter *)router;

/**
 *  Method to indicate that there are items to display
 *  @param items The list of items to display
 */
- (void)dataAvailable:(NSArray *)items;

@end
