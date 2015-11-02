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

package com.marpies.ane.androidutils.utils;

import com.adobe.fre.*;

import java.util.Set;

public class FREObjectUtils {

	public static Integer getInt( FREObject object ) {
		try {
			return object.getAsInt();
		} catch( Exception e ) {
			e.printStackTrace();
			return null;
		}
	}

	public static Double getDouble( FREObject object ) {
		try {
			return object.getAsDouble();
		} catch( Exception e ) {
			e.printStackTrace();
			return null;
		}
	}

	public static String getString( FREObject object ) {
		try {
			return object.getAsString();
		} catch( Exception e ) {
			e.printStackTrace();
			return null;
		}
	}

	public static Boolean getBoolean( FREObject object ) {
		try {
			return object.getAsBool();
		} catch( Exception e ) {
			e.printStackTrace();
			return false;
		}
	}

	public static FREArray getVectorFromSet( int numElements, boolean fixed, Set<Integer> set ) {
		try {
			FREArray vector = FREArray.newArray( "int", numElements, fixed );
			long i = 0;
			for( Integer element : set ) {
				vector.setObjectAt( i++, FREObject.newObject( element.intValue() ) );
			}
			return vector;
		} catch( FREASErrorException e ) {
			e.printStackTrace();
		} catch( FREWrongThreadException e ) {
			e.printStackTrace();
		} catch( FRENoSuchNameException e ) {
			e.printStackTrace();
		} catch( FREInvalidObjectException e ) {
			e.printStackTrace();
		} catch( FRETypeMismatchException e ) {
			e.printStackTrace();
		}
		return null;
	}

}
