# autopi_pi-ux

Flutter test local app web/android/ios for AutoPi - very much in pre Alpha - Demonstrate capabiity


## Environment

Install flutter 

https://flutter.dev/docs/get-started/install


enable for web developemnt 


https://flutter.dev/docs/get-started/web


runs locally (Mac Catalina)- docker config to come

It currently requires licence key to SyncFusion which can be got for free from 

https://www.syncfusion.com/downloads/communitylicense


## Setup

The sample currently requires auto-pi-ws to porvide test data. 

clone auto-pi-ws

```
npm install
````

````
node testserver.js
````

This simply runs a trivial node ws server to push trivial test data

clone auto-pi-ux

create file assets/config.json from assets/config.sample

{
    "SyncFusionKey" : "yourkey"
}

run the web version

```
flutter run -d Chrome 
```

## I need help

It is currently a pre pre pre alpha just to demonstrate technical components

I am after help in

1) Creation of a python module to replace the auto-pi-ws module. This needs to run on the autopi and publish on a ws data from PIDs and discovery data

As a start the format for the ws message is

{ "pid" : "pid" , "value" : value}

Discovery message to be described

2) Layout of the dashboards - from very simple (beta versions) to more complex. I indent to be using the SyncFusion package although happy to consider alternatives

Reach out to me if you want to help
