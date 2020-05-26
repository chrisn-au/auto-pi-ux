# autopi_pi-ux

Flutter test local app web/android/ios for AutoPi - very much in pre Alpha - Demonstrate capabiity


## Environment

Install flutter 
```
https://flutter.dev/docs/get-started/install
```

enable for web developemnt 

```
https://flutter.dev/docs/get-started/web
```

runs locally (Mac Catalina)- docker config to come
requires licence key to SyncFusion 

https://www.syncfusion.com/downloads/communitylicense


## Setup

The sample currently requires auto-pi-testws to porvide test data. 

clone auto-pi-testws
npm install
node server.js

clone auto-pi-ux

create file assets/config.json

{
    "SyncFusionKey" : "yourkey"
}

run the web version

```
flutter run -d Chrome 
```

## Getting Started

