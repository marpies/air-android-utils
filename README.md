# AIRAndroidUtils | Utility extension for Adobe AIR

Simple native extension offering several utility methods for Android platform:
* Getting full screen width & height of the device
* Getting [DisplayMetrics](https://developer.android.com/reference/android/util/DisplayMetrics.html)
* Getting system version
* Setting UI visibility flags
* Setting brightness
* Setting status bar color

## AIR SDK note

Including this and other extensions in your app increases the number of method references that must be stored in Android dex file. AIR currently supports a single dex file and since the number of such references is limited to a little over 65k, it is possible to exceed the limit by including several native extensions. This will prohibit you from building your app for Android, unless you reduce the number of features the app provides. Please, leave a vote in the report below to help adding multidex support to AIR SDK:

* [Bug 4190396 - Multidex support for Adobe AIR](https://bugbase.adobe.com/index.cfm?event=bug&id=4190396)

## Getting started

Just copy the extension from the `bin` directory over to your project and modify your app descriptor XML with the extension's ID:
```xml
<extensions>
    <extensionID>com.marpies.ane.androidutils</extensionID>
</extensions>
```

### Code snippets

#### Logs
```
// If desired, enable logging before calling any API
AIRAndroidUtils.logEnabled = true;
```

#### Full screen width & height
```
trace( AIRAndroidUtils.screenWidth );
trace( AIRAndroidUtils.screenHeight );
```

#### [DisplayMetrics](https://developer.android.com/reference/android/util/DisplayMetrics.html)
```
const dm:AIRAndroidUtilsDisplayMetrics = AIRAndroidUtils.displayMetrics;
trace( dm.density );
trace( dm.densityDpi );
trace( dm.widthPixels );
trace( dm.heightPixels );
trace( dm.xdpi );
trace( dm.ydpi );
```

#### System version
```
if( AIRAndroidUtils.systemVersion >= AIRAndroidUtilsVersionCodes.KITKAT ) {
    // Use KITKAT's API
}
```

#### UI visibility flags
```
// Immersive full screen
if( AIRAndroidUtils.isImmersiveFullScreenSupported ) {
    AIRAndroidUtils.setUIVisibility(
        AIRAndroidUtilsUIFlags.SYSTEM_UI_FLAG_HIDE_NAVIGATION | // Hides software buttons
        AIRAndroidUtilsUIFlags.SYSTEM_UI_FLAG_FULLSCREEN | // Hides status bar
        AIRAndroidUtilsUIFlags.SYSTEM_UI_FLAG_IMMERSIVE_STICKY // Enters immersive full screen
    );
}

// Temporarily hide the software buttons (appear on touch)
AIRAndroidUtils.setUIVisibility( AIRAndroidUtilsUIFlags.SYSTEM_UI_FLAG_HIDE_NAVIGATION );
```
See the class [AIRAndroidUtilsUIFlags.as](actionscript/src/com/marpies/ane/androidutils/data/AIRAndroidUtilsUIFlags.as) for available UI flags.

#### Brightness
```
// Use values from 0.0 to 1.0
AIRAndroidUtils.setBrightness( Math.random() );

// Use user's preferences
AIRAndroidUtils.setBrightness( -1 );
```

#### Status bar color
```
if( AIRAndroidUtils.isStatusBarColorSupported ) {
    // Color in the format #RRGGBB or #AARRGGBB, or one of the following values: red, blue, green, black, white, gray, cyan, magenta, yellow, lightgray, darkgray.
    AIRAndroidUtils.setStatusBarColor( "#FF0000" );
}
```

## Build ANE
ANT build scripts are available in the *build* directory. Edit *build.properties* to correspond with your local setup.

## Author
The ANE has been written by [Marcel Piestansky](https://twitter.com/marpies) and is distributed under [Apache License, version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html).

## Changelog

#### November 2, 2015 (v1.0.0)

* Public release