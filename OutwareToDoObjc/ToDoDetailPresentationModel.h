//
//  ToDoDetailPresentationModel.h
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The presentation model that will be used by the to do detail presenter
 */
@interface ToDoDetailPresentationModel : NSObject

/** The title of the to do item */
@property (nonatomic, copy) NSString *title;

/** The content of the to do item */
@property (nonatomic, copy) NSString *content;

@end
