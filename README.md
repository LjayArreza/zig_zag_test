# zig_zag

This is a test project for Zig Zag with clean archeticture using getX.


# About the app

The app app is more like Fetching of user data using a public REST API from Reqres.in.

# App Structure

```
- .env
    -- .env.prod
    -- .env.dev
-- lib
    -- app
        -- config
        -- core
            - base
            - components
            - routes
            - environment
        -- services
            - api
            - dio_service
            - share_storage
    -- data
        -- model
            - response
    -- domain
        -- repositories
    -- presentation
        -- views
        -- bindings
        -- controller
    -- main.dart
    -- initial.page.dart
     
```

# Packages Used

```
 flutter_dotenv
   |-- This is use for implementing different environment of the app like development and production with two different Base URL.
   
 get
   |-- This is a state management for flutter.
   
 dio
   |-- A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.
   
 logger
   |-- This is useful for developers specially handing in debug, to see the exact response and exact error.
   
 snippet_coder_utils
   |-- This library have a lot to offer, but for this project i'm using it for the loading dialog while calling the api.
   
 shared_preferences
   |-- Flutter plugin for reading and writing simple key-value pairs. Wraps NSUserDefaults on iOS and SharedPreferences on Android. I'm using this as a local storage for me to save the item locally and get it whenever i need it anytime, anywhere.
   
 fluttertoast: ^8.0.9
   |-- Is a dialog where you can display an error, or a notification to the user on every event.
   
```

# API Used

```
 BASE URL : https://reqres.in/
 USER LIST ENDPOINT : /api/users?page=2
 
 For those who are not familliar with reqres.in yet. This is a hosted REST-API ready to respond. You do not need to create fake data for your data creating. This is a real responses develop with real response codes. GET, POST, PUT & DELETE supported.
 
 Website: https://reqres.in/

```
