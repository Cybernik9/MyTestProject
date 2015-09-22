//
//  UIView+UItableViewCell.m
//  My test project
//
//  Created by Admin on 15.07.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "UIView+UItableViewCell.h"

@implementation UIView (UItableViewCell)

- (UITableViewCell*) superCell {
    
    if (!self.superview) {
        return nil;
    }
    
    if ([self.superview isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell*)self.superview;
    }
    
    return [self.superview superCell];
}

@end
