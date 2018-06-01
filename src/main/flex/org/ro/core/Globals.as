package org.ro.core {
import mx.utils.Base64Encoder;

import org.ro.handler.Dispatcher;
import org.ro.view.Dock;
import org.ro.view.RoMenuBar;
import org.ro.view.RoStatusBar;
import org.ro.view.RoView;
import org.ro.xhr.EventLog;

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
    private var log:EventLog = new EventLog();
    private var view:RoView = null;
    //TODO make private
    private var user:String;
    private var pw:String;
    private var url:String;
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

    public function getLog():EventLog {
        return log;
    }

    public function getMenu():Menu {
        return getMenuBar().getMenu();
    }

    public function setMenu(menu:Menu):void {
        getMenuBar().setMenu(menu);
    }

    public function getList():ObjectList {
        if (list == null) {
            list = new ObjectList();
        }
        return list;
    }

    public function setList(list:ObjectList):void {
        this.list = list;
    }

    public function setUser(user:String):void {
        this.user = user;
    }

    public function setUrl(url:String):void {
        this.url = url;
    }

    public function setPw(pw:String):void {
        this.pw = pw;
    }

    public function getCredentials():String {
        var credentials:String = this.user + ":" + this.pw;
        var encoder:Base64Encoder = new Base64Encoder();
        encoder.insertNewLines = false;
        encoder.encode(credentials);
        credentials = encoder.toString();
        return credentials;
    }

}
}
