This folder contains all the code logic for the firebase services used within the app

Auth class:
- The auth class contains two methods the registerUser method and the loginUser method.
Both methods accepts an AppUser object. The methods return a JSON containing two properties i.e a status code and a message. These JSON paramteres will be used to build the UI as per the actions.

- Usage:
1. import the class i.e import 'package:hoop/api/auth.dart';
2. Call any of the methods off of the Auth class. Note the methods are static. And pass an AppUser object to it with its parameters.
```DART
Map<String, dynamic> response = await Auth.loginUser(
    AppUser(
        displayName: "Emmanuel",
        email: "example@gmail.com",
        password: "password67",
        favoriteTeam: "Clippers"),
  );
```
3. The method will return a response JSON of either status 200 or 400 code.
example JSON is below
```JSON
{"code": 400, "message": "email doesn't exist"}, 
```
4. Cache the response and use it to continue building the UI.

Note: the config folder contains the firebase auth & cloud firestore instances initialized. Also contains snippets for setting up firebase emulator for local development.