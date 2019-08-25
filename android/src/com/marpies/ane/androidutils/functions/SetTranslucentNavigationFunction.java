/**
 * Copyright 2016 Marcel Piestansky (http://marpies.com)
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.marpies.ane.androidutils.functions;

import android.os.Build;
import android.view.Window;
import android.view.WindowManager;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREObject;
import com.marpies.ane.androidutils.utils.AIR;

public class SetTranslucentNavigationFunction extends BaseFunction {

	@Override
	public FREObject call( FREContext context, FREObject[] args ) {
		super.call( context, args );

		/* Enable translucent navigation on Kitkat and above */
		if( Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT ) {
			Window window = AIR.getContext().getActivity().getWindow();
			window.addFlags( WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION );
		}

		return null;
	}

}

