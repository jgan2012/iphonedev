//
//  MoviesViewController.m
//  RottenTomato
//
//  Created by Jim Gan on 1/31/15.
//  Copyright (c) 2015 Jim Gan. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"
#import "MovieDetailViewController.h"

@interface MoviesViewController()
@property (weak, nonatomic) IBOutlet UITableView *MovieTableView;
@property (strong,nonatomic) NSArray *names;
@property (strong,nonatomic) NSArray *movies;

@end

@implementation MoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.names=@[@"Jim", @"Peter", @"Andy", @"Home", @"Sarah", @"Tim", @"Mat", @"Brad", @"Tom", @"Sam", @"Kelly", @"Kim", @"Chris", @"Jake", @"Jason",@"Bim", @"Scott", @"Brad"];

     
     NSURL * url = [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dagqdghwaq3e3mxyrp7kmmj5&limit=20&country=us"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *responseDictionary =
        [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.movies = responseDictionary[@"movies"];
        [self.MovieTableView reloadData];
        NSLog(@"response: %@", responseDictionary);
        
    }];
    
    self.MovieTableView.dataSource = self;
    self.MovieTableView.delegate = self;
    
    //self.MovieTableView.title=@"Movie";
    
    self.MovieTableView.rowHeight=135;
    [self.MovieTableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.MovieTableView deselectRowAtIndexPath:indexPath animated:YES];
    MovieDetailViewController *mdvc = [[MovieDetailViewController alloc] init];
    mdvc.movie = self.movies[indexPath.row];
    [self.navigationController pushViewController:mdvc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    //return self.names.count;
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"-------------------------");
    NSLog(@"%@", [NSString stringWithFormat:@"section %ld row %ld", indexPath.section, indexPath.row]);
    //UITableViewCell *cell = [[UITableViewCell alloc] init];
   // cell.textLabel.text=self.names[indexPath.row];
   // cell.textLabel.text = [NSString stringWithFormat:@"section %ld row %ld", indexPath.section, indexPath.row];
    NSDictionary *movie = self.movies[indexPath.row];
    NSLog(@"movie: %@",movie);
    MovieCell *cell = [self.MovieTableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    cell.titleLabel.text=movie[@"title"];
    cell.synopsis.text=movie[@"synopsis"];
   
   
    [cell.posterView setImageWithURL:[NSURL URLWithString:[movie valueForKeyPath:@"posters.thumbnail"]]];
  
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
