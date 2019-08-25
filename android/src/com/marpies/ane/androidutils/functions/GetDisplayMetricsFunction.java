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

import android.util.DisplayMetrics;
import android.view.Display;
import com.adobe.fre.*;
import com.marpies.ane.androidutils.AIRAndroidUtilsExtensionContext;
import com.marpies.ane.androidutils.utils.AIR;

public class GetDisplayMetricsFunction extends BaseFunction {
	@Override
	public FREObject call( FREContext context, FREObject[] args ) {
		super.call( context, args );

		AIRAndroidUtilsExtensionContext extensionContext = AIR.getContext();
		Display display = extensionContext.getActivity().getWindowManager().getDefaultDisplay();
		DisplayMetrics metrics = new DisplayMetrics();
		display.getMetrics( metrics );

		try {
			FREObject[] params = new FREObject[6];
			params[0] = FREObject.newObject( metrics.density );
			params[1] = FREObject.newObject( metrics.densityDpi );
			params[2] = FREObject.newObject( metrics.widthPixels );
			params[3] = FREObject.newObject( metrics.heightPixels );
			params[4] = FREObject.newObject( metrics.xdpi );
			params[5] = FREObject.newObject( metrics.ydpi );
			return FREObject.newObject( "com.marpies.ane.androidutils.data.AndroidDisplayMetrics", params );
		} catch( FREWrongThreadException e ) {
			e.printStackTrace();
		} catch( FREASErrorException e ) {
			e.printStackTrace();
		} catch( FREInvalidObjectException e ) {
			e.printStackTrace();
		} catch( FRENoSuchNameException e ) {
			e.printStackTrace();
		} catch( FRETypeMismatchException e ) {
			e.printStackTrace();
		}

		return null;
	}

}
