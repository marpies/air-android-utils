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

public class InitFunction extends BaseFunction {

	@Override
	public FREObject call( FREContext context, FREObject[] args ) {
		super.call( context, args );

		AIR.setLogEnabled( FREObjectUtils.getBoolean( args[0] ) );
		AIR.log( "Initializing AIRAndroidUtils" );

		return null;
	}

}
