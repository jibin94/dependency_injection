## Dependency Injection
Dependency injection is a software design pattern that deals with the management and injection of dependencies into a class or module from the outside. It is essential to decouple components, making your code more maintainable, testable, and flexible.

**Why Use Dependency Injection in Flutter?**
- Loose Coupling: Dependency Injection helps reduce coupling between components, making it easier to modify or replace individual components without affecting the entire app. 
- Testability: With DI, you can easily mock dependencies, making it easier to write unit tests and ensure your app's reliability. 
- Flexibility: DI allows you to swap out dependencies with alternative implementations, making it easier to adapt to changing requirements. 
- Reusability: By decoupling components, you can reuse code more effectively, reducing duplication and improving maintainability.

**Types of Dependency Injection in Flutter**<br />
There are several ways to implement dependency injection in Flutter. Three common approaches are:

- **Constructor Injection**: Dependencies are injected through a class’s constructor.

```
class WeatherService {
  final ApiClient apiClient;

  WeatherService(this.apiClient);

  Future<WeatherData> getWeather(String city) async {
    return await apiClient.fetchWeather(city);
  }
}

class ApiClient {
  Future<WeatherData> fetchWeather(String city) async {
   // API call logic here
  }
}

// Usage
final apiClient = ApiClient();
final weatherService = WeatherService(apiClient);
final weatherData = await weatherService.getWeather('New York');
```

- **Setter Injection**: Dependencies are injected using setter methods.

```
class AuthService {
AuthProvider _authProvider;

void setAuthProvider(AuthProvider authProvider) {
   _authProvider = authProvider;
}

Future<User> signIn(String email, String password) async {
   return await _authProvider.signIn(email, password);
   }
}

class AuthProvider {
Future<User> signIn(String email, String password) async {
   // Authentication logic here
   }
}

// Usage
final authService = AuthService();
final authProvider = AuthProvider();
authService.setAuthProvider(authProvider);
final user = await authService.signIn('user@example.com', 'password123');
```

- Provider Injection: Dependencies are provided using a global service locator, Provider injection uses a service locator to provide dependencies globally. A popular package for this in Flutter is [get_it](https://pub.dev/packages/get_it).

```
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ApiService {
Future<List<dynamic>> fetchUsers() async {
   // Logic here
   }
}

// Setup
getIt.registerLazySingleton(() => ApiService());

// Usage
final apiService = getIt<ApiService>();
apiService.fetchUsers();
```
