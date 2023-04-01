# Introduction 💬
Geo-App is the platform that help user can track their pickup location and tracking the path.

# Features 
- Authentication with Amplify (signup, signin and signout)
- Integrated Mapbox as Map provider
- Highighted pickup location (draw a polygon by lines)
- Tracking path between 2 locations (destination is fixed now)

# Configuration
## Setup mapbox
- [Mapbox original guides](https://docs.mapbox.com/)
- Integrate secret key for your location machine
- Create .env file at project path by using structure at .env.example
## Setup Amplify
- [Amplify original guides](https://docs.amplify.aws/)

# User guide
![Screenshot 2023-04-02 at 00 40 34](https://user-images.githubusercontent.com/32502320/229307960-f00a9a4e-32e3-4e0e-959a-1dc39f097be8.png)

# Project architecture
![Screenshot 2023-04-02 at 01 20 44](https://user-images.githubusercontent.com/32502320/229307971-4fd43f34-dc9d-410c-9ea3-48e77ae2b81a.png)

- UIs: Widgets and Pages folder contains reusable UI element.
- Controller: Will be handled business logic. Controller's responsibilities are receiving data from UI, validate and send to repo, also receiving data from repo then send to UIs.
- Repo: Responsible are receiving data from controller, send to data layer (local storage, server, cloud, etc) and clean data before send it back to controller if repo receives data from data layer.
- Model: Responsible to converting from json to class instancee that can help develop more efficient.
# Design pattern used 
## Dependecy Injection
- Explanation: Each **controller** will be put in **binding** through dependencies function. Every time, you need controller to handle data just injecting the **binding** that put **controller** through **AppPage**. Then using Get.find() to get the controller instance
- Advantage: If there are more one places need using controller, just need inject its instance not create a new one.
## Factory 
- Use to create data models
# Folder overview
![Screenshot 2023-04-02 at 00 56 51](https://user-images.githubusercontent.com/32502320/229307979-3cf91f18-60b0-4513-9caf-1c5637aa0410.png)

# Dependencies
Thanks to:
- [Cupertino icons](https://pub.dev/packages/cupertino_icons)
- [Getx for state & routes management](https://pub.dev/packages/get) 
- [Geojson for geofencing](https://pub.dev/packages/geojson)
- [Amplify general](https://pub.dev/packages/amplify_flutter)
- [Amplify auth cognito for authentication](https://pub.dev/packages/amplify_auth_cognito)
- [Amplify datastore for local storage](https://pub.dev/packages/amplify_datastore)
- [Amplify api for setup API gateway](https://pub.dev/packages/amplify_api)
- [Flutter config for env config](https://pub.dev/packages/flutter_config)
- [Flutter animator for setup Splash logo animation](https://pub.dev/packages/flutter_animator)
- [Form validator for validating form](https://pub.dev/packages/form_validator)
- [Geolocator for get current location and setup locationOnChanged listener](https://pub.dev/packages/geolocator)
- [Flutter toast for local notification](https://pub.dev/packages/fluttertoast)
- [Flutter map for rendering Map](https://pub.dev/packages/flutter_map)
- [Latlong2 for LatLng model](https://pub.dev/packages/latlong2)
- [Dio for API calling](https://pub.dev/packages/dio)


