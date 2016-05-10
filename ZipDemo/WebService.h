@protocol WebServiceDelegate <NSObject>

- (void) webServiceResponce:(NSMutableArray *)arrResponse method:(NSString *)method webServiceName: (NSString *) strWebServiceName;
- (void) webServiceFailure:(NSError *)error method:(NSString *)method;

@end


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SampleProtocol.h"

@class WebService;

@interface WebService : NSObject <SampleProtocolDelegate>
{
    id <WebServiceDelegate> _delegate;
}

@property (nonatomic, strong) id <WebServiceDelegate>_delegate;

+ (WebService *) getInstance:(id <WebServiceDelegate>)delegate;
- (void) callWebService:(NSString *)urlString dictionarywithdata:(NSDictionary *)dict withType:(NSString *)getPost webServiceName: (NSString *)strWebServiceName;

@end


