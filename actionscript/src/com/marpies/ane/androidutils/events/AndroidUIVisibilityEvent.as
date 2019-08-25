package com.marpies.ane.androidutils.events {

    import flash.events.Event;

    public class AndroidUIVisibilityEvent extends Event {

        public static const CHANGE:String = "AndroidUIVisibilityEvent::change";

        private var mUIVisibility:int;

        public function AndroidUIVisibilityEvent(type:String, uiVisibility:int) {
            super( type );

            mUIVisibility = uiVisibility;
        }

        public function get uiVisibility():int {
            return mUIVisibility;
        }
    }

}
