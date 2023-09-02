/*Написать классы Doctor (Доктор) и Patient (Пациент). Доктор делегирует пациенту 
выпить пилюлю. Пациент по указанию доктора ее выпивает. Требуется реализовать 
взаимодействие доктора и пациента через делегат.
*/
// Doctor.h
#import <Foundation/Foundation.h>

@protocol DoctorDelegate <NSObject>
- (void)prescribeMedication;
@end

@interface Doctor : NSObject

@property (nonatomic, weak) id<DoctorDelegate> delegate;

- (void)delegatePrescribeMedication;

@end

// Doctor.m
#import "Doctor.h"

@implementation Doctor

- (void)delegatePrescribeMedication {
    if ([self.delegate respondsToSelector:@selector(prescribeMedication)]) {
        [self.delegate prescribeMedication];
    }
}

@end

// Patient.h
#import <Foundation/Foundation.h>

@protocol DoctorDelegate;

@interface Patient : NSObject<DoctorDelegate>

@end

// Patient.m
#import "Patient.h"

@implementation Patient

- (void)prescribeMedication {
    NSLog(@"Patient: Taking the prescribed medication.");
}

@end

// main.m
#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Patient.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Doctor *doctor = [[Doctor alloc] init];
        Patient *patient = [[Patient alloc] init];
        
        doctor.delegate = patient;
        
        [doctor delegatePrescribeMedication];
    }
    return 0;
}