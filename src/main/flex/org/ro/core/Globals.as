package org.ro.core {
import mx.collections.ArrayCollection;
import mx.core.FlexGlobals;

import org.ro.mx.Dock;
import org.ro.mx.RoStatusBar;
import org.ro.mx.RoView;
import org.ro.xhr.XhrLog;

public class Globals {

    public static function getDsp():Dispatcher {
        return getView().dsp
    }

    public static function getStatusBar():RoStatusBar {
        return getView().statusBar;
    }

    public static function getView():RoView {
        return FlexGlobals.topLevelApplication.view;
    }

    public static function addTab(objectList:ArrayCollection, s:String, ObjectsIcon:Class):void {
        getView().tabs.addTab(objectList, s, ObjectsIcon);
    }

    public static function amendMenu(menu:Menu):void {
        getView().menuBar.amend(menu);
    }

    public static function getDock():Dock {
        return getView().dock;
    }

    public static function getViewRegistry():ViewRegistry {
        return getDsp().viewRegistry;
    }

    public function getLog():XhrLog {
        return getDsp().log;
    }
    
}
}
