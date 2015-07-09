//
//  ToDoListRouter.h
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  The to do list router to navigate to next screen from the to do list
 */
@interface ToDoListRouter : NSObject

/**
 *  Method to return the to do detail view controller when an item has been selected
 *  @param index The to do item index to display in the detail view controller
 *  @param dismissBlock The block to be called when the detail view controller will be dismissed
 *  @return The initialised to do detail view controller
 */
- (UIViewController *)detailViewControllerForItemAtIndex:(NSInteger)index withDismiss:(void (^)(id))dismissBlock;

@end
