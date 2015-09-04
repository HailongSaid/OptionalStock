

#import "NXJsonParser.h"
#import "NXJsonSerializer.h"


@interface NotesNextiveJsonParser : NSObject

//解析出的数据内部是字典类型
@property (strong,nonatomic) NSMutableArray *notes;

//开始解析
-(void)start;

@end
