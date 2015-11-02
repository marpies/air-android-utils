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

import android.graphics.Point;
import android.os.Build;
import android.view.Display;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;
import com.marpies.ane.androidutils.AIRAndroidUtilsExtensionContext;
import com.marpies.ane.androidutils.utils.AIR;

public class GetScreenWidthFunction extends BaseFunction {
	@Override
	public FREObject call( FREContext context, FREObject[] args ) {
		super.call( context, args );

		AIRAndroidUtilsExtensionContext extensionContext = AIR.getContext();
		Display display = extensionContext.getActivity().getWindowManager().getDefaultDisplay();

		int width;
		Point size = new Point();
		if( Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1 ) {
			display.getRealSize( size );
			width = size.x;
		} else if( Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB_MR2 ) {
			display.getSize( size );
			width = size.x;
		} else {
			width = display.getWidth();
		}

		try {
			return FREObject.newObject( width );
		} catch( FREWrongThreadException e ) {
			e.printStackTrace();
		}

		return null;
	}

}
