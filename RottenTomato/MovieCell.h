//
//  MovieCell.h
//  RottenTomato
//
//  Created by Jim Gan on 1/31/15.
//  Copyright (c) 2015 Jim Gan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsis;


@end
