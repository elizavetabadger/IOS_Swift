#import <Foundation/Foundation.h>
#include <stdio.h>
#import "Robot.h"

// Написать класс Робот со свойствами: x, y, name. Координаты и имя соответственно.
@interface Robot ()

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
@property (nonatomic, strong) NSString *name;

@end

@implementation Robot

- (instancetype)initWithX:(NSInteger)x y:(NSInteger)y name:(NSString *)name {
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
        _name = name;
    }
    return self;
}

- (void)saveToUserDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@{@"x": @(self.x), @"y": @(self.y), @"name": self.name} forKey:self.name];
    [defaults synchronize];
}

- (void)readFromUserDefaultsAndDisplayInTextView:(NSTextView *)textView {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *robotDict = [defaults objectForKey:self.name];
    NSString *displayText = [NSString stringWithFormat:@"x: %@\ny: %@\nname: %@", robotDict[@"x"], robotDict[@"y"], robotDict[@"name"]];
    [textView setString:displayText];
}

- (void)saveToFile {
    NSString *filePath = [NSString stringWithFormat:@"%@.txt", self.name];
    NSString *fileContent = [NSString stringWithFormat:@"x: %ld\ny: %ld\nname: %@", self.x, self.y, self.name];
    NSError *error;
    BOOL success = [fileContent writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!success) {
        NSLog(@"Error writing to file: %@", error);
    }
}

- (void)readFromFileAndDisplayInTextView:(NSTextView *)textView {
    NSString *filePath = [NSString stringWithFormat:@"%@.txt", self.name];
    NSError *error;
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (!fileContent) {
        NSLog(@"Error reading from file: %@", error);
    } else {
        [textView setString:fileContent];
    }
}

@end

/* 1. Необходимо сохранить объект робота в userDefaults и считать из него в виде
TextView (или в консоль при технических сложностях).
2. Необходимо сохранить объект робота в userDefaults и считать из него в виде TextView
(или в консоль при технических сложностях).
3. Сохранить информацию о роботе в файл с названием таким же как имя робота и считать
содержимое файла, далее, отобразить в виде TextView (или в консоль при технических сложностях).
*/

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "Robot.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Robot *robot = [[Robot alloc] initWithX:10 y:20 name:@"Robi"];
        
        //Сохраняем объект в userDefaults
        [robot saveToUserDefaults];
        
        // Считываем из userDefaults объект в виде TextView
        NSTextView *textView = [[NSTextView alloc] initWithFrame:NSMakeRect(0, 0, 200, 200)];
        [robot readFromUserDefaultsAndDisplayInTextView:textView];
        NSLog(@"UserDefaults:\n%@", [textView string]);
        
        // Сохраняем файл
        [robot saveToFile];
        
        // Считываем файл и отображаем в виде TextView
        NSTextView *textView2 = [[NSTextView alloc] initWithFrame:NSMakeRect(0, 0, 200, 200)];
        [robot readFromFileAndDisplayInTextView:textView2];
        NSLog(@"File:\n%@", [textView2 string]);
    }
    return 0;
}
