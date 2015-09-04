

#import "NotesNextiveJsonParser.h"

@implementation NotesNextiveJsonParser

-(void)start
{
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"marketData" ofType:@"json"];
    
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    
    NXJsonParser* jsonParser = [[NXJsonParser alloc] initWithData:jsonData];
    id jsonObj = [jsonParser parse:nil ignoreNulls:NO];
	
    if (!jsonObj) {
        NSLog(@"JSON数据解析失败。");
        return;
    }
    
//    _notes = [jsonObj objectForKey:@"Record"];
    NSLog(@"%@",jsonObj);
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadViewNotification" object:self.notes userInfo:nil];
    self.notes = nil;

}

@end
