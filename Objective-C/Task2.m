/*
Задание
Создать абстрактный класс Figure с методами вычисления площади и периметра, а также методом, выводящим информацию о фигуре на экран.

Создать производные классы: Rectangle (прямоугольник), Circle (круг), Triangle (треугольник) со своими методами вычисления площади и периметра.

Создать массив n-фигур и вывести полную информацию о фигурах на экран.*/
// Figure.h

#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Circle.h"
#import "Triangle.h"

@interface Figure : NSObject

- (double)area;
- (double)perimeter;
- (void)printInfo;

@end
// Figure.m

#import "Figure.h"

@implementation Figure

- (double)area {
    NSLog(@"---");
    return 0;
}

- (double)perimeter {
    NSLog(@"---");
    return 0;
}

- (void)printInfo {
    NSLog(@"Figure");
    NSLog(@"Area: %.2f", [self area]);
    NSLog(@"Perimeter: %.2f", [self perimeter]);
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Rectangle *rectangle = [[Rectangle alloc] init];
        rectangle.width = 5.0;
        rectangle.height = 10.0;
        
        Circle *circle = [[Circle alloc] init];
        circle.radius = 3.0;
        
        Triangle *triangle = [[Triangle alloc] init];
        triangle.sideA = 3.0;
        triangle.sideB = 4.0;
        triangle.sideC = 5.0;
        
        NSMutableArray *figures = [NSMutableArray arrayWithObjects:rectangle, circle, triangle, nil];
        
        for (Figure *figure in figures) {
            [figure printInfo];
        }
    }
    return 0;
}

// Rectangle.h

#import "Figure.h"

@interface Rectangle : Figure

@property (nonatomic, assign) double width;
@property (nonatomic, assign) double height;

@end
// Rectangle.m

#import "Rectangle.h"

@implementation Rectangle

- (double)area {
    return self.width * self.height;
}

- (double)perimeter {
    return 2 * (self.width + self.height);
}

- (void)printInfo {
    NSLog(@"Rectangle");
    NSLog(@"Width: %.2f", self.width);
    NSLog(@"Height: %.2f", self.height);
    NSLog(@"Area: %.2f", [self area]);
    NSLog(@"Perimeter: %.2f", [self perimeter]);
    NSLog(@"---");
}

@end
// Circle.h

#import "Figure.h"

@interface Circle : Figure

@property (nonatomic, assign) double radius;

@end
// Circle.m

#import "Circle.h"

@implementation Circle

- (double)area {
    return M_PI * self.radius * self.radius;
}

- (double)perimeter {
    return 2 * M_PI * self.radius;
}

- (void)printInfo {
    NSLog(@"Circle");
    NSLog(@"Radius: %.2f", self.radius);
    NSLog(@"Area: %.2f", [self area]);
    NSLog(@"Perimeter: %.2f", [self perimeter]);
    NSLog(@"---");
}

@end
// Triangle.h

#import "Figure.h"

@interface Triangle : Figure

@property (nonatomic, assign) double sideA;
@property (nonatomic, assign) double sideB;
@property (nonatomic, assign) double sideC;

@end
// Triangle.m

#import "Triangle.h"

@implementation Triangle

- (double)area {
    double p = [self perimeter] / 2.0;
    return sqrt(p * (p - self.sideA) * (p - self.sideB) * (p - self.sideC));
}

- (double)perimeter {
    return self.sideA + self.sideB + self.sideC;
}

- (void)printInfo {
    NSLog(@"Triangle");
    NSLog(@"Side A: %.2f", self.sideA);
    NSLog(@"Side B: %.2f", self.sideB);
    NSLog(@"Side C: %.2f", self.sideC);
    NSLog(@"Area: %.2f", [self area]);
    NSLog(@"Perimeter: %.2f", [self perimeter]);
    NSLog(@"---");
}

@end