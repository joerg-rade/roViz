package org.ro.core {
import mx.core.FlexGlobals;
import mx.utils.Base64Encoder;

import org.ro.core.event.EventLog;
import org.ro.core.event.LogEntry;
import org.ro.core.model.ObjectAdapter;
import org.ro.core.model.ObjectList;
import org.ro.handler.Dispatcher;
import org.ro.view.IDockable;
import org.ro.view.RoMenuBar;
import org.ro.view.RoView;
import org.ro.view.tab.ListTab;
import org.ro.view.tab.ObjectTab;
import org.ro.view.tab.RoTabBar;

/**
 * Single Point of Contact between view components and all other classes.
 *
 * View components: RoView, RoStatusbar, RoMenubar, Tabs, Dock etc.
 * Other classes: handler, transferObjects (to), etc.
 *
 * - keeps track of connected server,
 * - the menu,
 * - object lists,
 *
 * @See https://en.wikipedia.org/wiki/Facade_pattern
 * @See https://en.wikipedia.org/wiki/Singleton_pattern
 */
public class Globals {
    private static var instance:Globals = null;
    private static var log:EventLog = initLog();

    private var dsp:Dispatcher = new Dispatcher();
    private var view:RoView = null;
    //TODO improve refactor into SessionManager
    private var user:String;
    private var pw:String;
    private var url:String;

    public static function getLog():EventLog {
        if (log == null) {
            log = initLog();
        }
        return log;
    }

    private static function initLog():EventLog {
        var app:Object = FlexGlobals.topLevelApplication;
        if (app.hasOwnProperty("LOG")) {
            return app.LOG;
        } else {
            return new EventLog();
        }
    }

    /**
     * Should only be called from within this class,
     * but ActionScript does not support private constructors.
     */
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

    public function getView():RoView {
        if (view == null) {
            view = new RoView();
        }
        return view;
    }

    public static function login(url:String, user:String, pw:String):void {
        getInstance().user = user;
        getInstance().pw = pw;
        getInstance().url = url;
        getInstance().getView().getStatusBar().user.text = user;
    }

    public static function updateStatus(le:LogEntry):void {
        getInstance().getView().getStatusBar().update(le);
    }

    //TODO refactor into DisplayManager
    public static function addListTab(objectList:ObjectList):void {
        var tabBar:RoTabBar = getInstance().getView().getTabs();
        var tab:ListTab = tabBar.addListTab(objectList);
        var title:String = tab.label;
        logAdd(title);
    }

    //TODO refactor into DisplayManager
    public static function addObjectTab(oa:ObjectAdapter):void {
        var tab:ObjectTab = getInstance().getView().getTabs().addObjectTab(oa);
        logAdd(tab.label);
    }

    private function getMenuBar():RoMenuBar {
        return getView().getMenuBar();
    }

    public static function amendMenu(menu:Menu):void {
        getInstance().getMenuBar().amend(menu);
    }

    public static function dockView(tab:IDockable):void {
        getInstance().getView().getDock().addView(tab);
    }

    public static function getMenu():Menu {
        return getInstance().getMenuBar().getMenu();
    }

    public static function setMenu(menu:Menu):void {
        getInstance().getMenuBar().setMenu(menu);
    }

    public static function getCredentials():String {
        var credentials:String = getInstance().user + ":" + getInstance().pw;
        var encoder:Base64Encoder = new Base64Encoder();
        encoder.insertNewLines = false;
        encoder.encode(credentials);
        credentials = encoder.toString();
        return credentials;
    }

    private static function logAdd(title:String):void {
        var le:LogEntry = log.find(title);
        if (le == null) {
            log.add(title);
        } else {
            le.cacheHits += 1;
            log.update(title);
        }
    }

    // delegate to HandlerChain
    public static function dspHandle(logEntry:LogEntry):void {
        getInstance().dsp.handle(logEntry);
    }

    // delegate to Tabs
    public static function addEventTab():void {
        var list:Vector.<LogEntry> = log.getEntries();
        getInstance().getView().getTabs().addEventTab(list);
    }

    public static function addTreeTab():void {
        var list:Vector.<LogEntry> = log.getEntries();
        getInstance().getView().getTabs().addTreeTab(list);
    }

    public static function toggleDock(toggle:Boolean):void {
        getInstance().getView().showDock(toggle);
    }

    public static function toggleStatus(toggle:Boolean):void {
        getInstance().getView().showStatus(toggle);
    }

}
}
