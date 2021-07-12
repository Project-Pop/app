## Steps to run app

### 1. Fetch the packages

    flutter pub get

### 2. Generate required files with build_runner

    flutter pub run build_runner watch --delete-conflicting-outputs

After successful build, terminate this process

### 3. Add config (Skip if you already have config setup)-

#### Create a folder in root directory of project

    mkdir config

1. create app_config.dev.yaml file and add properties

### 4. Run the project in any mode (debug/profile)

    flutter run -t lib/main.dev.dart
