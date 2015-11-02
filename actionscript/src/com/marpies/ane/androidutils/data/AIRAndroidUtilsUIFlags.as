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

package com.marpies.ane.androidutils.data {

    public class AIRAndroidUtilsUIFlags {

        /**
         * Special constant for {@link #setSystemUiVisibility(int)}: View has
         * requested the system UI (status bar) to be visible (the default).
         *
         * @see #setSystemUiVisibility(int)
         */
        public static const SYSTEM_UI_FLAG_VISIBLE:int = 0;

        /**
         * Flag for {@link #setSystemUiVisibility(int)}: View has requested the
         * system UI to enter an unobtrusive "low profile" mode.
         *
         * <p>This is for use in games, book readers, video players, or any other
         * "immersive" application where the usual system chrome is deemed too distracting.
         *
         * <p>In low profile mode, the status bar and/or navigation icons may dim.
         *
         * @see #setSystemUiVisibility(int)
         */
        public static const SYSTEM_UI_FLAG_LOW_PROFILE:int = 0x00000001;

        /**
         * Flag for {@link #setSystemUiVisibility(int)}: View has requested that the
         * system navigation be temporarily hidden.
         *
         * <p>This is an even less obtrusive state than that called for by
         * {@link #SYSTEM_UI_FLAG_LOW_PROFILE}; on devices that draw essential navigation controls
         * (Home, Back, and the like) on screen, <code>SYSTEM_UI_FLAG_HIDE_NAVIGATION</code> will cause
         * those to disappear. This is useful (in conjunction with the
         * {@link android.view.WindowManager.LayoutParams#FLAG_FULLSCREEN FLAG_FULLSCREEN} and
         * {@link android.view.WindowManager.LayoutParams#FLAG_LAYOUT_IN_SCREEN FLAG_LAYOUT_IN_SCREEN}
         * window flags) for displaying content using every last pixel on the display.
         *
         * <p>There is a limitation: because navigation controls are so important, the least user
         * interaction will cause them to reappear immediately.  When this happens, both
         * this flag and {@link #SYSTEM_UI_FLAG_FULLSCREEN} will be cleared automatically,
         * so that both elements reappear at the same time.
         *
         * @see #setSystemUiVisibility(int)
         */
        public static const SYSTEM_UI_FLAG_HIDE_NAVIGATION:int = 0x00000002;

        /**
         * Flag for {@link #setSystemUiVisibility(int)}: View has requested to go
         * into the normal fullscreen mode so that its content can take over the screen
         * while still allowing the user to interact with the application.
         *
         * <p>This has the same visual effect as
         * {@link android.view.WindowManager.LayoutParams#FLAG_FULLSCREEN
         * WindowManager.LayoutParams.FLAG_FULLSCREEN},
         * meaning that non-critical screen decorations (such as the status bar) will be
         * hidden while the user is in the View's window, focusing the experience on
         * that content.  Unlike the window flag, if you are using ActionBar in
         * overlay mode with {@link Window#FEATURE_ACTION_BAR_OVERLAY
         * Window.FEATURE_ACTION_BAR_OVERLAY}, then enabling this flag will also
         * hide the action bar.
         *
         * <p>This approach to going fullscreen is best used over the window flag when
         * it is a transient state -- that is, the application does this at certain
         * points in its user interaction where it wants to allow the user to focus
         * on content, but not as a continuous state.  For situations where the application
         * would like to simply stay full screen the entire time (such as a game that
         * wants to take over the screen), the
         * {@link android.view.WindowManager.LayoutParams#FLAG_FULLSCREEN window flag}
         * is usually a better approach.  The state set here will be removed by the system
         * in various situations (such as the user moving to another application) like
         * the other system UI states.
         *
         * <p>When using this flag, the application should provide some easy facility
         * for the user to go out of it.  A common example would be in an e-book
         * reader, where tapping on the screen brings back whatever screen and UI
         * decorations that had been hidden while the user was immersed in reading
         * the book.
         *
         * @see #setSystemUiVisibility(int)
         */
        public static const SYSTEM_UI_FLAG_FULLSCREEN:int = 0x00000004;

        /**
         * Flag for {@link #setSystemUiVisibility(int)}: View would like to remain interactive when
         * hiding the navigation bar with {@link #SYSTEM_UI_FLAG_HIDE_NAVIGATION}.  If this flag is
         * not set, {@link #SYSTEM_UI_FLAG_HIDE_NAVIGATION} will be force cleared by the system on any
         * user interaction.
         * <p>Since this flag is a modifier for {@link #SYSTEM_UI_FLAG_HIDE_NAVIGATION}, it only
         * has an effect when used in combination with that flag.</p>
         */
        public static const SYSTEM_UI_FLAG_IMMERSIVE:int = 0x00000800;

        /**
         * Flag for {@link #setSystemUiVisibility(int)}: View would like to remain interactive when
         * hiding the status bar with {@link #SYSTEM_UI_FLAG_FULLSCREEN} and/or hiding the navigation
         * bar with {@link #SYSTEM_UI_FLAG_HIDE_NAVIGATION}.  Use this flag to create an immersive
         * experience while also hiding the system bars.  If this flag is not set,
         * {@link #SYSTEM_UI_FLAG_HIDE_NAVIGATION} will be force cleared by the system on any user
         * interaction, and {@link #SYSTEM_UI_FLAG_FULLSCREEN} will be force-cleared by the system
         * if the user swipes from the top of the screen.
         * <p>When system bars are hidden in immersive mode, they can be revealed temporarily with
         * system gestures, such as swiping from the top of the screen.  These transient system bars
         * will overlay app’s content, may have some degree of transparency, and will automatically
         * hide after a short timeout.
         * </p><p>Since this flag is a modifier for {@link #SYSTEM_UI_FLAG_FULLSCREEN} and
         * {@link #SYSTEM_UI_FLAG_HIDE_NAVIGATION}, it only has an effect when used in combination
         * with one or both of those flags.</p>
         */
        public static const SYSTEM_UI_FLAG_IMMERSIVE_STICKY:int = 0x00001000;

        /**
         * Flag for {@link #setSystemUiVisibility(int)}: View would like its window
         * to be layed out as if it has requested
         * {@link #SYSTEM_UI_FLAG_HIDE_NAVIGATION}, even if it currently hasn't.  This
         * allows it to avoid artifacts when switching in and out of that mode, at
         * the expense that some of its user interface may be covered by screen
         * decorations when they are shown.  You can perform layout of your inner
         * UI elements to account for the navigation system UI through the
         * {@link #fitSystemWindows(Rect)} method.
         */
        public static const SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION:int = 0x00000200;

        /**
         * Flag for {@link #setSystemUiVisibility(int)}: View would like its window
         * to be layed out as if it has requested
         * {@link #SYSTEM_UI_FLAG_FULLSCREEN}, even if it currently hasn't.  This
         * allows it to avoid artifacts when switching in and out of that mode, at
         * the expense that some of its user interface may be covered by screen
         * decorations when they are shown.  You can perform layout of your inner
         * UI elements to account for non-fullscreen system UI through the
         * {@link #fitSystemWindows(Rect)} method.
         */
        public static const SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN:int = 0x00000400;

        /**
         * Flag for {@link #setSystemUiVisibility(int)}: When using other layout
         * flags, we would like a stable view of the content insets given to
         * {@link #fitSystemWindows(Rect)}.  This means that the insets seen there
         * will always represent the worst case that the application can expect
         * as a continuous state.  In the stock Android UI this is the space for
         * the system bar, nav bar, and status bar, but not more transient elements
         * such as an input method.
         *
         * The stable layout your UI sees is based on the system UI modes you can
         * switch to.  That is, if you specify {@link #SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN}
         * then you will get a stable layout for changes of the
         * {@link #SYSTEM_UI_FLAG_FULLSCREEN} mode; if you specify
         * {@link #SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN} and
         * {@link #SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION}, then you can transition
         * to {@link #SYSTEM_UI_FLAG_FULLSCREEN} and {@link #SYSTEM_UI_FLAG_HIDE_NAVIGATION}
         * with a stable layout.  (Note that you should avoid using
         * {@link #SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION} by itself.)
         *
         * If you have set the window flag {@link WindowManager.LayoutParams#FLAG_FULLSCREEN}
         * to hide the status bar (instead of using {@link #SYSTEM_UI_FLAG_FULLSCREEN}),
         * then a hidden status bar will be considered a "stable" state for purposes
         * here.  This allows your UI to continually hide the status bar, while still
         * using the system UI flags to hide the action bar while still retaining
         * a stable layout.  Note that changing the window fullscreen flag will never
         * provide a stable layout for a clean transition.
         *
         * <p>If you are using ActionBar in
         * overlay mode with {@link Window#FEATURE_ACTION_BAR_OVERLAY
         * Window.FEATURE_ACTION_BAR_OVERLAY}, this flag will also impact the
         * insets it adds to those given to the application.
         */
        public static const SYSTEM_UI_FLAG_LAYOUT_STABLE:int = 0x00000100;

    }

}
