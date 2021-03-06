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
import com.marpies.ane.androidutils.utils.FREObjectUtils;

public class SetCutoutModeFunction extends BaseFunction
{

    @Override
    public FREObject call(FREContext context, FREObject[] args)
    {
        super.call(context, args);

        if (Build.VERSION.SDK_INT >= 28) {
            int value = FREObjectUtils.getInt( args[0] );

            Window window = AIR.getContext().getActivity().getWindow();
            WindowManager.LayoutParams params = window.getAttributes();
            params.layoutInDisplayCutoutMode = value;
            window.setAttributes(params);
        }

        return null;
    }

}

