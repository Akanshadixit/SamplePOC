//
//  LocationModel.m
//  JsonParser
//
//  Created by magic on 27/12/16.
//  Copyright © 2016 magic. All rights reserved.
//

#import "LocationModel.h"

@implementation LocationModel

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _title = [jsonDictionary objectForKey:@"title"];
        _place = [jsonDictionary objectForKey:@"place"];
       
        
    }
    
    return self;
}



@end
