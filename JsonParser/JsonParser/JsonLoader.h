//
//  JsonLoader.h
//  JsonParser
//
//  Created by magic on 27/12/16.
//  Copyright © 2016 magic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonLoader : NSObject


-(NSArray *)locationsFromJSONFile:(NSURL *)url;

@end
