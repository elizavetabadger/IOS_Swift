/*Задание
Решить квадратные уравнения:
x^2 – 8x + 12 = 0,
12x^2 – 4x + 2 = 0,
x^2 – 100x - 2 = 0
(заменять константы в коде).*/


#import <Foundation/Foundation.h>

double calculateDiscriminant(double a, double b, double c) {
    return pow(b, 2) - 4 * a * c;
}

NSArray *solveQuadraticEquation(double a, double b, double c) {
    double discriminant = calculateDiscriminant(a, b, c);
    if (discriminant < 0) {
        return @[];
    } else if (discriminant == 0) {
        double solution = -b / (2 * a);
        return @[@(solution)];
    } else {
        double firstSolution = (-b + sqrt(discriminant)) / (2 * a);
        double secondSolution = (-b - sqrt(discriminant)) / (2 * a);
        return @[@(firstSolution), @(secondSolution)];
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // x^2 – 8x + 12 = 0
        double a1 = 1;
        double b1 = -8;
        double c1 = 12;
        NSArray *solutions1 = solveQuadraticEquation(a1, b1, c1);
        NSLog(@"Solutions for x^2 – 8x + 12 = 0: %@", solutions1);
        
        // 12x^2 – 4x + 2 = 0
        double a2 = 12;
        double b2 = -4;
        double c2 = 2;
        NSArray *solutions2 = solveQuadraticEquation(a2, b2, c2);
        NSLog(@"Solutions for 12x^2 – 4x + 2 = 0: %@", solutions2);
        
        // x^2 – 100x - 2 = 0
        double a3 = 1;
        double b3 = -100;
        double c3 = -2;
        NSArray *solutions3 = solveQuadraticEquation(a3, b3, c3);
        NSLog(@"Solutions for x^2 – 100x - 2 = 0: %@", solutions3);
    }
    return 0;
}

/*Создать программу, которая находит большее число среди 3-х чисел.*/

#import <Foundation/Foundation.h>
int find_max(int numbers[], int N){
    int max = numbers[0];
    for(int i=1;i<N;i++)
        if(max>numbers[i])max=numbers[i];

    return max;
}

//int m = MAX(myI1, MAX(myI2, myI3));

/*NSNumber *findMaxNumber(NSNumber *number1, NSNumber *number2, NSNumber *number3) {
    NSArray *numbers = @[number1, number2, number3];
    NSNumber *maxNumber = [numbers valueForKeyPath:@"@max.self"];
    return maxNumber;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSNumber *number1 = @10;
        NSNumber *number2 = @20;
        NSNumber *number3 = @15;
        
        NSNumber *maxNumber = findMaxNumber(number1, number2, number3);
        NSLog(@"The max number is %@", maxNumber);
    }
    return 0;
}*/

