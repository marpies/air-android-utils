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

import android.graphics.Color;
import android.os.Build;
import android.view.Window;
import android.view.WindowManager;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREObject;
import com.marpies.ane.androidutils.utils.AIR;
import com.marpies.ane.androidutils.utils.FREObjectUtils;

public class SetStatusBarColorFunction extends BaseFunction {

	@Override
	public FREObject call( FREContext context, FREObject[] args ) {
		super.call( context, args );

		if( Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP ) {
			AIR.log( "Changing status bar color is not supported" );
			return null;
		}

		try {
			int color = Color.parseColor( FREObjectUtils.getString( args[0] ) );
			Window window = AIR.getContext().getActivity().getWindow();
			window.clearFlags( WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS );
			window.addFlags( WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS );
			window.setStatusBarColor( color );
		} catch( Exception e ) {
			AIR.log( "Error parsing status bar color: " + e.getMessage() );
		}

		return null;
	}

}
