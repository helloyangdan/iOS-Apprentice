//
//  SearchResult.m
//  StoreSearch
//
//  Created by danyang on 15/5/17.
//  Copyright (c) 2015年 dan yang. All rights reserved.
//

#import "SearchResult.h"

@implementation SearchResult

- (NSComparisonResult)compareName:(SearchResult *)other
{
    return [self.name localizedStandardCompare:other.name];
}

@end
