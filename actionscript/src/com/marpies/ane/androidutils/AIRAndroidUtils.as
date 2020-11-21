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

    import com.marpies.ane.androidutils.data.AndroidDisplayMetrics;
    import com.marpies.ane.androidutils.events.AndroidUIVisibilityEvent;

    import flash.events.EventDispatcher;

    import flash.events.StatusEvent;
    import flash.external.ExtensionContext;
    import flash.system.Capabilities;

    public class AIRAndroidUtils {

        private static const TAG:String = "[AIRAndroidUtils]";
        private static const EXTENSION_ID:String = "com.marpies.ane.androidutils";

        private static const UI_VISIBILITY_CHANGE:String = "AIRAndroidUtils::ui_change";

        private static var LOG_ENABLED:Boolean;

        private static var mContext:ExtensionContext;
        private static var mEventDispatcher:EventDispatcher;

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
         * @private
         */
        public static function addEventListener( type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false ):void {
            eventDispatcher.addEventListener( type, listener, useCapture, priority, useWeakReference );
        }

        /**
         * @private
         */
        public static function removeEventListener( type:String, listener:Function ):void {
            eventDispatcher.removeEventListener( type, listener );
        }

        /**
         * @private
         */
        public static function hasEventListener( type:String ):void {
            eventDispatcher.hasEventListener( type );
        }

        /**
         * Sets UI visibility flags.
         * @param flags Values from the <code>AndroidUIFlags</code> class.
         * @see com.marpies.ane.androidutils.data.AndroidUIFlags
         */
        public static function setUIVisibility( flags:int ):void {
            if( !isSupported || !initExtensionContext() ) return;

            mContext.call( "setUIVisibility", flags );
        }

        /**
         * Hides the status bar. This changes flags on the entire application's window and not the main view.
         * This means that when another native view appears (for example, a dialog), the status bar will stay hidden.
         * If the status bar was hidden using <code>setUIVisibility</code> then it would show up when the dialog appears.
         */
        public static function hideWindowStatusBar():void {
            if( !isSupported || !initExtensionContext() ) return;

            mContext.call( "hideWindowStatusBar" );
        }

        /**
         * Makes the navigation bar translucent. Supported on Android Kitkat (API 19) and above.
         */
        public static function setTranslucentNavigation():void {
            if( !isSupported || !initExtensionContext() ) return;

            mContext.call( "setTranslucentNavigation" );
        }

        /**
         * Changes color of the status bar.
         * @param color Color in the format <code>#RRGGBB</code> or <code>#AARRGGBB</code>, or one of the following values:
         *              <code>red</code>, <code>blue</code>, <code>green</code>, <code>black</code>, <code>white</code>,
         *              <code>gray</code>, <code>cyan</code>, <code>magenta</code>, <code>yellow</code>, <code>lightgray</code>,
         *              <code>darkgray</code>.
         */
        public static function setStatusBarColor( color:String ):void {
            if( !isSupported || !initExtensionContext() ) return;

            if( !color ) throw new ArgumentError( "Parameter color cannot be null." );

            mContext.call( "setStatusBarColor", color );
        }

        /**
         * Set brightness for application's window.
         * @param value Decimal between 0-1, or -1 to use user's preference.
         */
        public static function setBrightness( value:Number ):void {
            if( !isSupported || !initExtensionContext() ) return;

            mContext.call( "setBrightness", value );
        }

        /**
         * Enables or disables system UI visibility listener.
         * Add event listener for <code>AndroidUIVisibilityEvent.CHANGE</code> to be notified
         * when the system UI flags change.
         *
         * @param enable Set to <code>true</code> to enable the listener, <code>false</code> to remove it.
         */
        public static function enableUIVisibilityListener( enable:Boolean ):void {
            if( !isSupported || !initExtensionContext() ) return;
            
            mContext.call( "enableUIVisibilityListener", enable );
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

        private static function initExtensionContext():Boolean {
            if( !isSupported ) return false;

	        if( mContext !== null ) return true;

            if( mContext === null ) {
                mContext = ExtensionContext.createExtensionContext( EXTENSION_ID, null );
            }

            if( mContext !== null ) {
                mContext.call( "init", LOG_ENABLED );
	            mContext.addEventListener( StatusEvent.STATUS, onStatus );
                return true;
            }

            log( "Error creating extension context for " + EXTENSION_ID );
            return false;
        }


        private static function onStatus( event:StatusEvent ):void {
		    if( event.code == UI_VISIBILITY_CHANGE ) {
                eventDispatcher.dispatchEvent( new AndroidUIVisibilityEvent( AndroidUIVisibilityEvent.CHANGE, int( event.level ) ) );
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
            if( !isSupported || !initExtensionContext()  ) return 0;

            return mContext.call( "getScreenWidth") as int;
        }

        public static function get screenHeight():int {
            if( !isSupported || !initExtensionContext()  ) return 0;

            return mContext.call( "getScreenHeight") as int;
        }

        public static function get displayMetrics():AndroidDisplayMetrics {
            if( !isSupported || !initExtensionContext()  ) return null;

            return mContext.call( "getDisplayMetrics") as AndroidDisplayMetrics;
        }

        public static function get systemVersion():int {
            if( !isSupported || !initExtensionContext()  ) return 0;

            return mContext.call( "getSystemVersion") as int;
        }

        public static function get supportedUIFlags():Vector.<int> {
            if( !isSupported || !initExtensionContext() ) return new <int>[];

            return mContext.call( "getSupportedUIFlags") as Vector.<int>;
        }

        public static function get isStatusBarColorSupported():Boolean {
            if( !isSupported || !initExtensionContext()  ) return false;

            return mContext.call( "isStatusBarColorSupported") as Boolean;
        }

        public static function get isImmersiveFullScreenSupported():Boolean {
            if( !isSupported || !initExtensionContext()  ) return false;
            
            return mContext.call( "isImmersiveFullScreenSupported") as Boolean;
        }

        /**
         * Extension version.
         */
        public static function get version():String {
            return "1.2.0";
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

        private static function get eventDispatcher():EventDispatcher {
            if( !mEventDispatcher ) {
                mEventDispatcher = new EventDispatcher();
            }
            return mEventDispatcher;
        }

        private static function log( message:String ):void {
            if( LOG_ENABLED ) {
                trace( TAG, message );
            }
        }

    }
}
