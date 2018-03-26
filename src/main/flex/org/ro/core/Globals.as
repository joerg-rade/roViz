package org.ro.core {
import org.ro.handler.Dispatcher;
import org.ro.mx.Dock;
import org.ro.mx.RoMenuBar;
import org.ro.mx.RoStatusBar;
import org.ro.mx.RoView;
import org.ro.xhr.RequestLog;

/**
 * Pattern: Singleton, Facade
 * Single Point of Contact between view components and all other classes.
 * 
 * View components: RoView, RoStatusbar, RoMenubar, Tabs, Dock etc.
 * Other classes: handler, transferObjects (to), etc.
 * 
 * - keeps track of connected server,
 * - the menu,
 * - object lists,
 */
public class Globals {
    private static var instance:Globals = null;
    private var dsp:Dispatcher = new Dispatcher();
    private var log:RequestLog = new RequestLog();
    private var view:RoView = null;
    //TODO make private
    public var credentials:String;
    public var user:String;
    public var url:String;
    private var list:ObjectList;

    //TODO make private
    function Globals(view:RoView = null) {
        if (instance == null) {
            this.view = view;
            instance = this;
        }
    }

    public static function getInstance():Globals {
        if (instance == null) {
            instance = new Globals();
        }
        return instance;
    }

    public function getDsp():Dispatcher {
        return dsp;
    }

    public function getView():RoView {
        if (view == null) {
            view = new RoView();
        }
        return view;
    }

    public function getStatusBar():RoStatusBar {
        return getView().getStatusBar();
    }

    public function addTab(objectList:ObjectList, s:String, ObjectsIcon:Class):void {
        getView().getTabs().addTab(objectList, s, ObjectsIcon);
    }

    private function getMenuBar():RoMenuBar {
        return getView().getMenuBar();
    }

    public function amendMenu(menu:Menu):void {
        getMenuBar().amend(menu);
    }

    public function getDock():Dock {
        return getView().getDock();
    }

    public function getLog():RequestLog {
        return log;
    }

    public function getMenu():Menu {
        return getMenuBar().getMenu();
    }

    public function setMenu(menu:Menu):void {
        getMenuBar().setMenu(menu);
    }

    public function getList():ObjectList {
        return list;
    }

    public function setList(list:ObjectList):void {
        this.list = list;
    }

}
}
