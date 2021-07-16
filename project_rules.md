# Config Reader

1. Works according to environment
2. Provide immutable access points for configurational data such as Urls, secret keys etc

# Services

1. Singleton classes
2. Use "ConfigReader" for configurational data
3. Define apis and methods to communicate with server
4. Static logic
5. Functions contain Low Level implementation details, throws appropriate errors. These can return dynamic responses

# Models

1. Request Models => Data models used for sending data to server
2. Response Models => Data models used for receiving data from server
3. Enums => Support Models for fields of Request/Response Models to restrict the values

These are used across the whole project

# Providers

1. Contain data objects
2. Handle the High Level implementation details of functions. These functions translate dynamic/error response from Services and return simple data to be used for simple UI related decisions
3. Use "Services"

# UI

## Business (Handlers)

1. Initialize and communicate with "Providers"
2. Use functions and data from "Providers"
3. Control the UI parameters based on data.
4. Control the user actions like onTap, text field controllers etc.
5. Control the navigation between screens and are responsible for state management

## Views (Screens/Pages/Widgets)

1. Contain end-user UI code
2. Genrally small widgets
3. Takes data and functions in form of final parameters within constructors.
4. Generally stateless widgets and const constructors

# App Profiles

1. DEV (main.dev.dart): Used for the purpose of local development to isolate the production resources. It keeps the production server and database unaffected from local development and testing. Dev related configurations are to be provided in "config/app_config.dev.yaml". Use "main.dev.dart" to run the project in this profile.

2. PROD (main.prod.dart): Used for building production version of app and releasing it to public. This profile is used only after proper testing and assurance of dev profile app. Any errors/malfunctions in this app can harm the production server and database. It's configuration is only available with allowed members of team.
