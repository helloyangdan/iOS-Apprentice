//
//  DataModel.m
//  Checklists
//
//  Created by danyang on 15/5/9.
//  Copyright (c) 2015年 dan yang. All rights reserved.
//

#import "DataModel.h"
#import "Checklist.h"

@implementation DataModel

- (void)handleFirstTime
{
    BOOL firstTime = [[NSUserDefaults standardUserDefaults] boolForKey:@"FirstTime"];
    
    if (firstTime) {
        Checklist *checklist = [[Checklist alloc] init];
        checklist.name = @"List";
        
        [self.lists addObject:checklist];
        [self setIndexOfSelectedChecklist:0];
        
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"FirstTime"];
    }
}

- (id)init
{
    if ((self = [super init])) {
        [self loadChecklists];
        [self registerDefauls];
        [self handleFirstTime];
    }
    return  self;
}

- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    return documentsDirectory;
}

- (NSString *)dataFilePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"Checklists.plist"];
}

- (void)saveChecklists
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self.lists forKey:@"Checklists"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

- (void)loadChecklists
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        
        self.lists = [unarchiver decodeObjectForKey:@"Checklists"];
        [unarchiver finishDecoding];
    } else {
        self.lists = [[NSMutableArray alloc] initWithCapacity:20];
    }
}

- (void)registerDefauls
{
    NSDictionary *dictionary = @{ @"ChecklistIndex" : @-1, @"FirstTime" : @YES };
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
}

- (NSInteger)indexOfSelectedChecklist
{
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"ChecklistIndex"];
}

- (void)setIndexOfSelectedChecklist:(NSInteger)index
{
    [[NSUserDefaults standardUserDefaults] setInteger:index forKey:@"ChecklistIndex"];
}

@end
