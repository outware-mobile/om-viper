//
//  ToDoDetailInteractor.m
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import "ToDoDetailInteractor.h"

#import "ToDoItemInteractor.h"
#import "ToDoItem.h"
#import "ToDoDetailPresentationModel.h"

@implementation ToDoDetailInteractor

- (void)refreshData
{
    ToDoItem *item = [[ToDoItemInteractor sharedInteractor] itemAtIndex:self.indexToRetrieve];
    ToDoDetailPresentationModel *model = [[ToDoDetailPresentationModel alloc] init];
    model.title = item.title;
    model.content = item.content;

    [self.presenter dataAvailable:model];
}

@end
