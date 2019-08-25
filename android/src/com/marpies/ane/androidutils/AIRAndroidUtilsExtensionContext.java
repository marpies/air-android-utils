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

package com.marpies.ane.androidutils;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.marpies.ane.androidutils.functions.*;
import com.marpies.ane.androidutils.utils.AIR;

import java.util.HashMap;
import java.util.Map;

public class AIRAndroidUtilsExtensionContext extends FREContext {

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> functions = new HashMap<String, FREFunction>();

		functions.put( "init", new InitFunction() );

		functions.put( "getScreenWidth", new GetScreenWidthFunction() );
		functions.put( "getScreenHeight", new GetScreenHeightFunction() );
		functions.put( "getDisplayMetrics", new GetDisplayMetricsFunction() );

		functions.put( "getSystemVersion", new GetSystemVersionFunction() );

		functions.put( "getSupportedUIFlags", new GetSupportedUIFlagsFunction() );
		functions.put( "setUIVisibility", new SetUIVisibilityFunction() );

		functions.put( "setStatusBarColor", new SetStatusBarColorFunction() );
		functions.put( "setBrightness", new SetBrightnessFunction() );

		functions.put( "hideWindowStatusBar", new HideWindowStatusBarFunction() );
		functions.put( "setTranslucentNavigation", new SetTranslucentNavigationFunction() );

		functions.put( "isStatusBarColorSupported", new IsStatusBarColorSupportedFunction() );
		functions.put( "isImmersiveFullScreenSupported", new IsImmersiveFullScreenSupportedFunction() );

		return functions;
	}

	@Override
	public void dispose() {
		AIR.setContext( null );
	}
}
