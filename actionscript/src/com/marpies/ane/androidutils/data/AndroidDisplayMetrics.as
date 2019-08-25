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

package com.marpies.ane.androidutils.data {

	/**
	 * https://developer.android.com/reference/android/util/DisplayMetrics.html
	 */
	public class AndroidDisplayMetrics {

		private var mDensity:Number;
		private var mDensityDpi:int;
		private var mWidthPixels:int;
		private var mHeightPixels:int;
		private var mXdpi:Number;
		private var mYdpi:Number;

		public function AndroidDisplayMetrics( density:Number, densityDpi:int, widthPixels:int, heightPixels:int, xdpi:Number, ydpi:Number ) {
			mDensity = density;
			mDensityDpi = densityDpi;
			mWidthPixels = widthPixels;
			mHeightPixels = heightPixels;
			mXdpi = xdpi;
			mYdpi = ydpi;
		}

		public function toString():String {
			return "Density: " + mDensity+ ", densityDpi: " + mDensityDpi+ ", screenWidth: " + mWidthPixels+ ", screenHeight: " + mHeightPixels+ ", xdpi: " + mXdpi+ ", ydpi: " + mYdpi;
		}

		public function get density():Number {
			return mDensity;
		}

		public function get densityDpi():int {
			return mDensityDpi;
		}

		public function get widthPixels():int {
			return mWidthPixels;
		}

		public function get heightPixels():int {
			return mHeightPixels;
		}

		public function get xdpi():Number {
			return mXdpi;
		}

		public function get ydpi():Number {
			return mYdpi;
		}

	}

}