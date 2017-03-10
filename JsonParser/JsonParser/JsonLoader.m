//
//  JsonLoader.m
//  JsonParser
//
//  Created by magic on 27/12/16.
//  Copyright © 2016 magic. All rights reserved.
//

#import "JsonLoader.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "LocationModel.h"

@implementation JsonLoader
NSData *ndata;

-(NSArray *)locationsFromJSONFile:(NSURL *)url {
    // Create a NSURLRequest with the given URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
    
    // Get the data
    NSURLResponse *response;
    //NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&amp;response error:nil];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];


    
    // Now create a NSDictionary from the JSON data
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    // Create a new array to hold the locations
    NSMutableArray *locations = [[NSMutableArray alloc] init];
    
    // Get an array of dictionaries with the key "locations"
    NSArray *array = [jsonDictionary objectForKey:@"locations"];
    // Iterate through the array of dictionaries
    for(NSDictionary *dict in array) {
        // Create a new Location object for each one and initialise it with information in the dictionary
       LocationModel  *location = [[LocationModel alloc] initWithJSONDictionary:dict];
        // Add the Location object to the array
        [locations addObject:location];
    }
    
    // Return the array of Location objects
    return locations;

}
@end
