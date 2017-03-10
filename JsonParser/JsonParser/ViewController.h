//
//  ViewController.h
//  JsonParser
//
//  Created by magic on 26/12/16.
//  Copyright © 2016 magic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *locations;
}
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readwrite,nonatomic) NSString *title;
@property (readonly) NSString *place;
@property (readonly) NSNumber *latitude;
@property (readonly) NSNumber *longitude;
@property (readonly) NSString *information;
@property (readonly) NSString *telephone;
@property (readonly) NSString *url;
@property (readonly) NSNumber *visited;

@property (nonatomic,readwrite) IBOutlet UITableView *tableView;

@end

