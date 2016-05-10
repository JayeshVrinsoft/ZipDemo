//
//  ViewController.m
//  ZipDemo
//
//  Created by Jayesh Patel on 23/04/16.
//  Copyright © 2016 Jayesh Patel. All rights reserved.
//

#import "ViewController.h"
#import "defines.h"
#import "SSZipArchive/SSZipArchive.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    [self getFileFromURL];
}

- (void) getFileFromURL
{
    [self myMethod:^(BOOL finished) {
        if(finished){
            NSLog(@"success");
        }
    }];
}

-(void) myMethod:(myCompletion) compblock{
    APP_DELEGATE.sampleObj.delegate = self;
    NSString *str = [NSString stringWithFormat:@"UserName=jayeshmardiya&Password=Mardiya@123"];
    [APP_DELEGATE.sampleObj callLoginWS:str];
}

#pragma mark - Sample Protocol Delegate -

- (void)processCompletedMethod
{
    NSLog(@"Delegate Call");
}

- (void)optionalCompletedMethod
{
    NSLog(@"Optional Delegate Call");
}

- (NSString *) applicationDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

- (NSArray *) listFileAtPath:(NSString *) path
{
    int count;
    NSArray *directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:NULL];
    for (count = 0; count < (int)[directoryContent count]; count++)
    {
        NSLog(@"File %d: %@", (count + 1), [directoryContent objectAtIndex:count]);
    }
    return directoryContent;
}

- (IBAction) btnUnzipClicked:(id)sender
{
    NSString *stringURL = @"http://crm.vrinsofts.com/Projectdiscussionfiles/tenants-update-20-4.zip";
    NSURL  *url = [NSURL URLWithString:stringURL];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    if (urlData)
    {
        NSString *filePath = [NSString stringWithFormat:@"%@/%@",documentsDirectory,@"tenants-update-20-4.zip"];
        NSLog(@"%@",filePath);
        [urlData writeToFile:filePath atomically:YES];
    }
    
    NSString *filePath = [[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"tenants-update-20-4.zip"];
    
    [SSZipArchive unzipFileAtPath:filePath toDestination:documentsDirectory];
}

- (IBAction) btnClearDirectoryClicked:(id)sender
{
    NSString *folderPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSError *error = nil;
    for (NSString *file in [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:&error]) {
        [[NSFileManager defaultManager] removeItemAtPath:[folderPath stringByAppendingPathComponent:file] error:&error];
    }
}

- (IBAction) btnListOfFileClicked:(id)sender
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSArray *listOfFiles = [self listFileAtPath:documentsDirectory];
    NSLog(@"%@",listOfFiles);
}

- (void) webServiceResponce:(NSMutableArray *)arrResponse method:(NSString *)method webServiceName: (NSString *) strWebServiceName;
{
    
}

- (void) webServiceFailure:(NSError *)error method:(NSString *)method
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
