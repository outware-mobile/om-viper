//
//  ToDoDataStore.m
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import "ToDoDataStore.h"

@implementation ToDoDataStore

+ (instancetype)sharedStore
{
    static ToDoDataStore *dataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataStore = [[ToDoDataStore alloc] init];
    });
    return dataStore;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray *array = [NSMutableArray array];
        
        ToDoItem *item1 = [[ToDoItem alloc] init];
        item1.title = @"FOO";
        item1.content = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc purus mauris, feugiat a ornare et, faucibus non ligula. Vestibulum ut eleifend eros, ut luctus justo. Nunc et maximus odio. Morbi imperdiet varius libero semper pellentesque. Sed aliquam quis enim eu eleifend. Aliquam vitae nibh aliquet, convallis metus quis, posuere libero. Suspendisse congue, quam eu semper ullamcorper, sapien diam mattis massa, in elementum lorem ex in leo. Maecenas fermentum justo vitae pellentesque interdum. Proin risus mi, ullamcorper ac gravida volutpat, placerat a turpis. Integer laoreet sed augue eget mollis. Suspendisse quis nunc in eros condimentum euismod. Duis et auctor nibh, eu aliquam nisl. Morbi cursus sit amet enim sit amet sodales.";
        [array addObject:item1];
        
        item1 = [[ToDoItem alloc] init];
        item1.title = @"BAR";
        item1.content = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed felis purus. Sed malesuada malesuada nunc ut imperdiet. Ut ac consequat velit. Phasellus lobortis velit eget erat auctor bibendum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse diam eros, interdum sit amet interdum ut, vulputate vel metus. Aenean egestas pulvinar justo id rutrum. Cras placerat mollis mauris id gravida. Sed nisl urna, sodales ut porta id, auctor ac mauris. Donec vestibulum ex et lorem feugiat iaculis. Etiam aliquam orci quam, eu luctus lectus placerat ac. Etiam cursus non nisl a euismod. Nulla et nunc a enim ullamcorper commodo. Aliquam quis urna vel eros lobortis vulputate vitae id magna. Sed eu accumsan libero.";
        [array addObject:item1];
        
        item1 = [[ToDoItem alloc] init];
        item1.title = @"BAZ";
        item1.content = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam non mauris euismod, ullamcorper odio quis, mattis enim. Curabitur maximus venenatis justo, non laoreet lacus porta at. Nulla facilisi. Nullam sed hendrerit arcu. Sed ornare lobortis egestas. Proin et libero mattis, commodo turpis eget, tincidunt est. Vivamus hendrerit interdum quam, ut gravida arcu hendrerit bibendum. Pellentesque a ultrices arcu, a sagittis justo. Nam dapibus ipsum dolor.";
        [array addObject:item1];
        
        _items = [array copy];
    }

    return self;
}

@end
