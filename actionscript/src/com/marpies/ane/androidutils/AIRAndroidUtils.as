/**
 * Copyright 2015 Marcel Piestansky (http://marpies.com)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.marpies.ane.androidutils {

    import flash.desktop.NativeApplication;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.events.InvokeEvent;
    import flash.events.StatusEvent;
    import flash.external.ExtensionContext;
    import flash.net.URLRequest;
    import flash.system.Capabilities;

    import com.marpies.ane.androidutils.data.AIRAndroidUtilsDisplayMetrics;

    public class AIRAndroidUtils {

        private static const TAG:String = "[AIRAndroidUtils]";
        private static const EXTENSION_ID:String = "com.marpies.ane.androidutils";

        private static var LOG_ENABLED:Boolean;

        private static var mContext:ExtensionContext;

        /**
         * Do not use. AIRAndroidUtils is a static class.
         */
        public function AIRAndroidUtils() {
            throw Error( "AIRAndroidUtils is static class." );
        }

        /**
         *
         *
         * Public API
         *
         *
         */

        /**
         * Sets UI visibility flags.
         * @param flags Values from the <code>AIRAndroidUtilsUIFlags</code> class.
         * @see com.marpies.ane.androidutils.data.AIRAndroidUtilsUIFlags
         */
        public static function setUIVisibility( flags:int ):void {
            if( !isSupported ) return;

            checkExtensionContext();

            mContext.call( "setUIVisibility", flags );
        }

        /**
         * Changes color of the status bar.
         * @param color Color in the format <code>#RRGGBB</code> or <code>#AARRGGBB</code>, or one of the following values:
         *              <code>red</code>, <code>blue</code>, <code>green</code>, <code>black</code>, <code>white</code>,
         *              <code>gray</code>, <code>cyan</code>, <code>magenta</code>, <code>yellow</code>, <code>lightgray</code>,
         *              <code>darkgray</code>.
         */
        public static function setStatusBarColor( color:String ):void {
            if( !isSupported ) return;

            checkExtensionContext();

            if( !color ) throw new ArgumentError( "Parameter color cannot be null." );

            mContext.call( "setStatusBarColor", color );
        }

        /**
         * Set brightness for application's window.
         * @param value Decimal between 0-1, or -1 to use user's preference.
         */
        public static function setBrightness( value:Number ):void {
            if( !isSupported ) return;

            checkExtensionContext();

            mContext.call( "setBrightness", value );
        }

        /**
         * Disposes native extension context.
         */
        public static function dispose():void {
            if( !isSupported ) return;
            if( !mContext ) return;

            mContext.dispose();
            mContext = null;
        }

        /**
         *
         *
         * Private API
         *
         *
         */
        
        private static function init():Boolean {
            if( !isSupported ) return false;

            /* Initialize context */
            mContext = ExtensionContext.createExtensionContext( EXTENSION_ID, null );
            if( !mContext ) {
                log( "Error creating extension context for " + EXTENSION_ID );
                return false;
            }
            mContext.call( "init", LOG_ENABLED );
            return true;
        }

        private static function checkExtensionContext():void {
            if( !mContext ) {
                init();
            }
        }

        /**
         *
         *
         * Getters / Setters
         *
         *
         */

        public static function get screenWidth():int {
            if( !isSupported ) return 0;

            checkExtensionContext();
            
            return mContext.call( "getScreenWidth") as int;
        }

        public static function get screenHeight():int {
            if( !isSupported ) return 0;

            checkExtensionContext();
            
            return mContext.call( "getScreenHeight") as int;
        }

        public static function get displayMetrics():AIRAndroidUtilsDisplayMetrics {
            if( !isSupported ) return null;

            checkExtensionContext();
            
            return mContext.call( "getDisplayMetrics") as AIRAndroidUtilsDisplayMetrics;
        }

        public static function get systemVersion():int {
            if( !isSupported ) return 0;

            checkExtensionContext();
            
            return mContext.call( "getSystemVersion") as int;
        }

        public static function get supportedUIFlags():Vector.<int> {
            if( !isSupported ) return new <int>[];

            checkExtensionContext();
            
            return mContext.call( "getSupportedUIFlags") as Vector.<int>;
        }

        public static function get isStatusBarColorSupported():Boolean {
            if( !isSupported ) return false;

            checkExtensionContext();
            
            return mContext.call( "isStatusBarColorSupported") as Boolean;
        }

        public static function get isImmersiveFullScreenSupported():Boolean {
            if( !isSupported ) return false;

            checkExtensionContext();
            
            return mContext.call( "isImmersiveFullScreenSupported") as Boolean;
        }

        /**
         * Extension version.
         */
        public static function version():String {
            return "1.0.0";
        }

        /**
         * Supported on Android only.
         */
        public static function get isSupported():Boolean {
            return Capabilities.manufacturer.indexOf( "Android" ) > -1;
        }

        /**
         *
         */
        public static function get logEnabled():Boolean {
            return LOG_ENABLED;
        }

        public static function set logEnabled( value:Boolean ):void {
            LOG_ENABLED = value;
        }

        /**
         *
         *
         * Private API
         *
         *
         */

        private static function log( message:String ):void {
            if( LOG_ENABLED ) {
                trace( TAG, message );
            }
        }

    }
}
