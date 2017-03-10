//
//  ViewController.m
//  JsonParser
//
//  Created by magic on 26/12/16.
//  Copyright © 2016 magic. All rights reserved.
//

#import "ViewController.h"
#import "JsonLoader.h"
#import "LocationModel.h"
@interface ViewController ()

@end



@implementation ViewController
@synthesize tableView;


@synthesize title;
@synthesize place;
@synthesize information;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JsonLoader *jsonLoader = [[JsonLoader alloc] init];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"BookTheme" withExtension:@"json"];
    self.tableView.delegate = self;
    // Load the data on a background queue...
    // As we are using a local file it's not really necessary, but if we were connecting to an online URL then we'd need it
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        locations = [jsonLoader locationsFromJSONFile:url];
        // Now that we have the data, reload the table data on the main UI thread
        [self.tableView reloadData];
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [locations count];
}


- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)anIndexPath{
    NSString *theCellKey = @"header";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:theCellKey];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:theCellKey];
    }
    LocationModel *loc = [locations objectAtIndex:anIndexPath.row];
    cell.textLabel.text = loc.title;
    
    
    return cell;
}


@end
