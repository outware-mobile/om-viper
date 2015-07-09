//
//  ToDoDetailViewController.m
//  OutwareToDoObjc
//
//  Created by Bjorn Juwen Ho on 23/12/2014.
//  Copyright (c) 2014 Bjorn Juwen Ho. All rights reserved.
//

#import "ToDoDetailViewController.h"
#import "ToDoDetailViewModel.h"

@interface ToDoDetailViewController ()
@property (nonatomic, strong) ToDoDetailViewModel* viewModel;
@end

@implementation ToDoDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.handler refreshData];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissButtonTapped:)];
}

- (void)dismissButtonTapped:(id)sender
{
    [self.handler dismiss];
}

- (void)displayItem:(ToDoDetailViewModel *)item
{
    self.viewModel = item;
}

- (void)setViewModel:(ToDoDetailViewModel *)viewModel
{
    _viewModel = viewModel;

    self.title = viewModel.title;
    self.textView.text = viewModel.content;
}

@end
