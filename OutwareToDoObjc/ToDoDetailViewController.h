//
//  ToDoDetailViewController
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoDetailEventHandler.h"
#import "ToDoDetailUserInterface.h"

/**
 *  The view controller to display the to do item
 */
@interface ToDoDetailViewController : UIViewController <ToDoDetailUserInterface>

/** The text view to display the content of the to do item */
@property (weak, nonatomic) IBOutlet UITextView *textView;

/** The event handler for user events */
@property (nonatomic, strong) id<ToDoDetailEventHandler> handler;

@end

