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

package com.marpies.ane.androidutils.utils;

import android.util.Log;
import com.marpies.ane.androidutils.AIRAndroidUtilsExtensionContext;

public class AIR {

	private static final String TAG = "AIRAndroidUtils";
	private static Boolean mLogEnabled;

	private static AIRAndroidUtilsExtensionContext mContext;

    public static void dispatchEvent( String eventName, String message ) {
        mContext.dispatchStatusEventAsync( eventName, message );
    }

	public static void log( String message ) {
		if( mLogEnabled ) {
			Log.i( TAG, message );
		}
	}

	/**
	 *
	 *
	 * Getters / Setters
	 *
	 *
	 */

	public static AIRAndroidUtilsExtensionContext getContext() {
		return mContext;
	}
	public static void setContext( AIRAndroidUtilsExtensionContext context ) {
		mContext = context;
	}

	public static Boolean getLogEnabled() {
		return mLogEnabled;
	}
	public static void setLogEnabled( Boolean value ) {
		mLogEnabled = value;
	}

}
