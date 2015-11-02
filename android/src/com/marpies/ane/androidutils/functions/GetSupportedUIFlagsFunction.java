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

import android.os.Build;
import android.view.View;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREObject;
import com.marpies.ane.androidutils.utils.FREObjectUtils;

import java.util.HashSet;
import java.util.Set;

public class GetSupportedUIFlagsFunction extends BaseFunction {

	@Override
	public FREObject call( FREContext context, FREObject[] args ) {
		super.call( context, args );

		Set<Integer> supportedFlags = new HashSet<Integer>();

		int systemVersion = Build.VERSION.SDK_INT;
		if( systemVersion >= Build.VERSION_CODES.ICE_CREAM_SANDWICH ) {
			supportedFlags.add( View.SYSTEM_UI_FLAG_VISIBLE );
			supportedFlags.add( View.SYSTEM_UI_FLAG_LOW_PROFILE );
			supportedFlags.add( View.SYSTEM_UI_FLAG_HIDE_NAVIGATION );
		}
		if( systemVersion >= Build.VERSION_CODES.JELLY_BEAN ) {
			supportedFlags.add( View.SYSTEM_UI_FLAG_FULLSCREEN );
		}
		if( systemVersion >= Build.VERSION_CODES.KITKAT ) {
			supportedFlags.add( View.SYSTEM_UI_FLAG_IMMERSIVE );
			supportedFlags.add( View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY );
		}

		return FREObjectUtils.getVectorFromSet( supportedFlags.size(), true, supportedFlags );
	}

}
