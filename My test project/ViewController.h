//
//  ViewController.h
//  My test project
//
//  Created by Admin on 15.07.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

- (IBAction)actionInfoCell:(id)sender;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end