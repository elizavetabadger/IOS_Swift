/*
1. Сделать обращение к серверам yandex.ru для получения поискового запроса (можно захардкодить поисковой запрос).
*/
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Создание URL-адреса для запроса к серверу yandex.ru
        NSString *searchQuery = @"example";
        NSString *searchURLString = [NSString stringWithFormat:@"https://yandex.ru/search/?text=%@", searchQuery];
        NSURL *searchURL = [NSURL URLWithString:searchURLString];
        
        // Создание запроса
        NSURLRequest *request = [NSURLRequest requestWithURL:searchURL];
        
        // Отправка синхронного запроса
        NSURLResponse *response;
        NSError *error;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        if (responseData != nil) {
            // Обработка полученных данных (responseData)
            NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
            
            // Вывод результата обращения к серверу yandex.ru
            NSLog(@"Результат запроса: %@", responseString);
        } else {
            // Вывод ошибки, если запрос не выполнен успешно
            NSLog(@"Ошибка при выполнении запроса: %@", error.localizedDescription);
        }
    }
    return 0;
}