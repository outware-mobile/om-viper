//
//  ToDoDetailInteractor.h
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ToDoDetailPresenter.h"

/**
 *  The to do detail screen's interactor. Responsible for fetching the to do item detail to display
 */
@interface ToDoDetailInteractor : NSObject

/** The presenter to send updates on when data has been retrieved */
@property (nonatomic, weak) ToDoDetailPresenter *presenter;

/** The index of the to do item to retrieve */
@property (nonatomic, assign) NSInteger indexToRetrieve;

/** 
 *  Method to refresh its data
 */
- (void)refreshData;

@end
