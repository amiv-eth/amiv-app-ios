#  Amiv Micro App Developer Guide

This is a short guide with instructions for you, to create your own amiv micro app.

## What is a micro app

An amiv micro app is an "app inside the app".  Micro apps are used for services, that have a special functionality that is not that important to the rest of the app. e.g. the checkin app. It is used to checkin people in and out of events. This functinality is very specific and not widely used by all users, only by event organisers.

## What you need to do to get your micro app to show up inside the app

First of all, create your micro app and place it inside its own folder under `Amiv -> Amiv Apps -> Apps`.

Second, for your app to be called, your start up class needs to conform to `AmivMicroApp`.  It includes the rootViewController which will be presented first. Also it includes the `start()` function. This function is called right before the first view of your micro app is shown. Use it to do any aditional setup. In the end, return `true` when your app is ready to show its content, else return `false` and your app will get killed.
It is recommended to use the navigator / controller pattern for your micro app.

Next, add your app `AmivMicroAppType` and edit the `createApp(:)` function in `AmivMicroAppsNavigator`. There call your root class, which conforms to `AmivMicroApp`.

Lastly, to get your app to show up, add a `create<yourMicroApp>Model()` inside the `AmivMicroAppModel` and add the model in the `models` array inside the `createModels()` function. Now your app should show up alongside the other micro apps.

## Killing your app

There needs to be a way for your micro app to get dismissed and to get back to the rest of the amiv app. This means, that you need to implement a "leave app" button, "close" button or something the like. The button then needs to call the `AmivMicroAppDelegate.appIsFinished()` method. The delegate is inside your root class which conforms to `AmivMicroApp`.
After you have called this function, the app will be killed and the user returns to the main app.

**Note**: If you do not implement a "leave app" button, the user has no chance to leave your micro app and get to the main app. The only way to get back is to kill the main app alltogether and start it up again. This is a really bad user experience, which means you really need to implement a way to leave the app.
