//
//  ViewController.m
//  My test project
//
//  Created by Admin on 15.07.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import "Cities.h"
#import "UIView+UItableViewCell.h"

@interface ViewController () 

@property (strong, nonatomic) NSMutableArray* citiesArray;
@property (strong, nonatomic) NSMutableArray* searchArray;

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Cities";
    
    self.citiesArray = [[NSMutableArray alloc] initWithArray:[Cities getCitiesArray] copyItems:YES];
    self.searchArray = [[NSMutableArray alloc] initWithArray:[Cities getAboutCitiesArray] copyItems:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action

- (IBAction)actionInfoCell:(id)sender {
    
    UITableViewCell* cell = [sender superCell];
    
    if (cell) {
        
        NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
        
        [[[UIAlertView alloc]
          initWithTitle:[NSString stringWithFormat:@"%@", [self.citiesArray objectAtIndex:indexPath.row]]
          message:[NSString stringWithFormat:@"%@", [self.searchArray objectAtIndex:indexPath.row]]
          delegate:nil
          cancelButtonTitle:@"OK"
          otherButtonTitles:nil] show];
        
        
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.citiesArray count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"Cell";
    
    Cell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    NSString *nameCity = [self.citiesArray objectAtIndex: indexPath.row];
    cell.nameLable.text = nameCity;
    
    UIImage *image = [UIImage imageNamed:nameCity];
    cell.imageCities.image = image;
 
    return cell;

}


#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    [searchBar setShowsCancelButton:YES animated:YES];
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
    
}

- (NSMutableArray*) generateSectionsFromCitiesArray:(NSArray*) array withFilter:(NSString*) filterString {
    
    NSMutableArray* searchArray = [[NSMutableArray alloc] init];
    
    filterString = [filterString lowercaseString];
    
    for (int i=0; i < [array count]; i++) {
        
        NSString* string = [array[i] lowercaseString];
        
        if ([filterString length] > 0 && [string rangeOfString:filterString].location == NSNotFound) {
            continue;
        }
        
        [searchArray addObject:array[i]];
        
    }
    
    return searchArray;
}

- (NSMutableArray*) generateSectionsFromAboutCitiesArray {
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    NSArray* citiesArray = [[NSArray alloc] initWithArray:[Cities getCitiesArray] copyItems:YES];
    
    int k=0;
    for (int i=0; i<[self.citiesArray count]; i++) {
        for (int j=k; j<[citiesArray count]; j++) {
            if ([self.citiesArray[i] isEqualToString:citiesArray[j]]) {
                [array addObject:[Cities getAboutCity:j]];
                k=++j;
            }
        }
    }
    
    return array;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    self.citiesArray = [self generateSectionsFromCitiesArray:[Cities getCitiesArray] withFilter:searchText];
    self.searchArray = [self generateSectionsFromAboutCitiesArray];
    
    [self.tableView reloadData];
  
}


@end
