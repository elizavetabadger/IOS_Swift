/*Реализовать класс робота (Robot). В классе должны быть свойства координаты x, y 
(по умолчанию в начале 0, 0) и метод run. Метод принимает блок, в зависимости от 
сообщения в блоке (up, down, left, right) робот движется в соответствующем 
направлении (изменяется его текущая координата). Сообщения в блоках возвращается 
только в виде строк (up, down, left, right).
Продемонстрировать движение робота по прямоугольной системе координат.
*/

#import <Foundation/Foundation.h>

@interface Robot : NSObject

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;

- (void)run:(void(^)(NSString *direction))block;

@end

@implementation Robot

- (instancetype)init {
    self = [super init];
    if (self) {
        _x = 0;
        _y = 0;
    }
    return self;
}

- (void)run:(void(^)(NSString *direction))block {
    if (block) {
        block(@"up");
        self.y++;
        
        block(@"down");
        self.y--;
        
        block(@"left");
        self.x--;
        
        block(@"right");
        self.x++;
    }
}
//Робот движется вверх на единицу, затем вниз, затем влево и вправо, изменяя свои координаты. Результат выполнения кода будет:


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Robot *robot = [[Robot alloc] init];
        
        [robot run:^(NSString *direction) {
            NSLog(@"%@", direction);
        }];
        
        NSLog(@"Robot coordinates: x=%ld, y=%ld", (long)robot.x, (long)robot.y);
    }
    return 0;
}
