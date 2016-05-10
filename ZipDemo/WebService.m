
#import "AFHTTPRequestOperationManager.h"
#import "WebService.h"
#import "SampleProtocol.h"

static id<WebServiceDelegate> smartDelegate;

@implementation WebService
@synthesize _delegate;

#pragma mark
#pragma mark Webservice
#pragma mark

NSOperationQueue *operationQueue;

+ (WebService *)getInstance:(id<WebServiceDelegate>) delegate
{
    smartDelegate = delegate;
    static WebService *instance = nil;
    instance = [[self alloc] init];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        operationQueue = [[NSOperationQueue alloc] init];
    });
    return instance;
}

- (void) callWebService:(NSString *)urlString dictionarywithdata:(NSDictionary *)dict withType:(NSString *)getPost webServiceName:(NSString *)strWebServiceName
{
    AFHTTPRequestOperationManager *manager1 = [AFHTTPRequestOperationManager manager];
    manager1.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *params = dict;
   
    if ([getPost isEqualToString:@"post"])
    {
        [manager1 POST:urlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             NSString *returnString=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
             NSString *returnString1=[returnString stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
             returnString1=[returnString1 stringByReplacingOccurrencesOfString:@"&amp" withString:@"&"];
             returnString1=[returnString1 stringByReplacingOccurrencesOfString:@"&#039;" withString:@"'"];
             returnString1=[returnString1 stringByReplacingOccurrencesOfString:@"&#034;" withString:@"\""];
             
             NSData *mydata = [returnString1 dataUsingEncoding:NSUTF8StringEncoding];
             NSError *e;
             NSMutableArray *returnArry = [NSJSONSerialization JSONObjectWithData:mydata options:NSJSONReadingMutableContainers error:&e];
             
             NSLog(@"%@",returnArry);
             
             if (operation.response.statusCode == 200 && smartDelegate !=nil)
             {
                 [smartDelegate webServiceResponce:returnArry method:@"get" webServiceName:strWebServiceName];
             }
         }
         
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             [smartDelegate webServiceFailure:error method:@"post"];
         }];
    }
    else
    {
        [manager1 GET:urlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
             NSString *returnString=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
             NSString *returnString1=[returnString stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
             returnString1=[returnString1 stringByReplacingOccurrencesOfString:@"&amp" withString:@"&"];
             returnString1=[returnString1 stringByReplacingOccurrencesOfString:@"&#039;" withString:@"'"];
             returnString1=[returnString1 stringByReplacingOccurrencesOfString:@"&#034;" withString:@"\""];
            
             NSData *mydata = [returnString1 dataUsingEncoding:NSUTF8StringEncoding];
             NSError *e;
             NSMutableArray *returnArry = [NSJSONSerialization JSONObjectWithData:mydata options:NSJSONReadingMutableContainers error:&e];
            
             NSLog(@"%@",returnArry);
            
             if (operation.response.statusCode == 200 && smartDelegate !=nil)
             {
                 [smartDelegate webServiceResponce:returnArry method:@"get" webServiceName:strWebServiceName];
             }
         }
         
              failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             [smartDelegate webServiceFailure:error method:@"post"];
         }];
    }
}

- (void) webServiceResponce:(NSMutableArray *)arrResponse method:(NSString *)method webServiceName: (NSString *) strWebServiceName
{
}

- (void) webServiceFailure:(NSError *)error method:(NSString *)method
{
}
@end
