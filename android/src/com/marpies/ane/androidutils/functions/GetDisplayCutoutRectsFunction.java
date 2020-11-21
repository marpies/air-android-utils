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

import android.graphics.Rect;
import android.os.Build;
import android.view.DisplayCutout;
import android.view.View;
import com.adobe.fre.FREArray;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREObject;
import com.marpies.ane.androidutils.utils.AIR;

import java.util.List;

public class GetDisplayCutoutRectsFunction extends BaseFunction
{

    @Override
    public FREObject call(FREContext context, FREObject[] args)
    {
        super.call(context, args);

        if (Build.VERSION.SDK_INT >= 28) {
            try {
                View view = AIR.getContext().getActivity().getWindow().getDecorView();
                DisplayCutout cutout = view.getRootWindowInsets().getDisplayCutout();
                if (cutout == null) {
                    return null;
                }

                List<Rect> rects = cutout.getBoundingRects();

                FREArray freArray = FREArray.newArray("flash.geom.Rectangle", rects.size(), true);
                long i = 0;

                for(Rect rect : rects) {
                    FREObject x = FREObject.newObject(rect.left);
                    FREObject y = FREObject.newObject(rect.top);
                    FREObject w = FREObject.newObject(rect.width());
                    FREObject h = FREObject.newObject(rect.height());
                    FREObject[] params = new FREObject[] { x, y, w, h };
                    FREObject freRect = FREObject.newObject("flash.geom.Rectangle", params);
                    freArray.setObjectAt(i, freRect);
                    i++;
                }

                return freArray;
            } catch(Exception e) {
                e.printStackTrace();
            }
        }

        return null;
    }

}

