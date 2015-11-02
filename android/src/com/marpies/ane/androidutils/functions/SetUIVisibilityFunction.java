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

package com.marpies.ane.androidutils.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREObject;
import com.marpies.ane.androidutils.utils.AIR;
import com.marpies.ane.androidutils.utils.FREObjectUtils;

public class SetUIVisibilityFunction extends BaseFunction {

	@Override
	public FREObject call( FREContext context, FREObject[] args ) {
		super.call( context, args );

		int flags = FREObjectUtils.getInt( args[0] );

		AIR.getContext().getActivity().getWindow().getDecorView().setSystemUiVisibility( flags );

		// SYSTEM_UI_FLAG_HIDE_NAVIGATION     14
		// hide nav, appears on touch

		// SYSTEM_UI_FLAG_LOW_PROFILE     14   (STATUS_BAR_HIDDEN 11)
		// dim status bar and nav

		// SYSTEM_UI_FLAG_VISIBLE       14   (STATUS_BAR_VISIBLE 11)
		// status bar visible (default)

		// SYSTEM_UI_FLAG_FULLSCREEN		 16
		// hides status bar

		// SYSTEM_UI_FLAG_IMMERSIVE 			19
		// immersive but on swipe the status and nav remain visible

		// SYSTEM_UI_FLAG_IMMERSIVE_STICKY 			19
		// truly immersive

		// IMMERSIVE
		// use with SYSTEM_UI_FLAG_HIDE_NAVIGATION, SYSTEM_UI_FLAG_FULLSCREEN

		return null;
	}

}
