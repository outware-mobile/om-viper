//
//  ToDoDetailPresenter.h
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ToDoDetailEventHandler.h"
#import "ToDoDetailUserInterface.h"
#import "ToDoDataStore.h"
#import "ToDoDetailPresentationModel.h"

@class ToDoDetailInteractor;

/**
 *  The presenter for the to do detail screen. Controls presentation logic for the view
 */
@interface ToDoDetailPresenter : NSObject <ToDoDetailEventHandler>

/** The user interface for the presenter to send display updates */
@property (nonatomic, weak) id<ToDoDetailUserInterface> userInterface;

/** The interactor for the to do detail screen */
@property (nonatomic, strong) ToDoDetailInteractor *interactor;

/**
 *  The method to initialise the presenter
 *  @param dismissBlock The block that will be called when the user interface is dismissed
 *  @return The initialised instance
 */
- (instancetype)initWithDismiss:(void (^)(id userInterface))dismissBlock;

/**
 *  Method that will be called when there is data available, in this case when there is
 *  an item to present
 *  @param item The presentation model data that the presenter will use to prepare user interface updates
 */
- (void)dataAvailable:(ToDoDetailPresentationModel *)item;

@end
