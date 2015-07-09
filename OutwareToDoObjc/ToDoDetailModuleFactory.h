//
//  ToDoDetailModuleFactory.h
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  The to do detail screen module factory
 */
@interface ToDoDetailModuleFactory : NSObject

/**
 *  The class method to create the to do detail screen
 *  @param itemIndex The index that will be used to retrieve the to do item
 *  @param dismissBlock The block that will be called when the to do detail screen is to be dismissed
 *  @return The to do detail view controller to present
 */
+ (UIViewController*)createModuleWithItem:(NSInteger)itemIndex withDismiss:(void (^) (id))dismissBlock;

@end
