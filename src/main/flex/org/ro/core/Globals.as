package org.ro.core {
import mx.utils.Base64Encoder;

import org.ro.core.event.EventLog;
import org.ro.core.event.LogEntry;
import org.ro.core.model.ObjectAdapter;
import org.ro.core.model.ObjectList;
import org.ro.handler.Dispatcher;
import org.ro.layout.Layout;
import org.ro.view.Dock;
import org.ro.view.IDockable;
import org.ro.view.RoMenuBar;
import org.ro.view.RoStatusBar;
import org.ro.view.RoView;

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
    private var user:String;
    private var pw:String;
    private var url:String;
    private var list:ObjectList;

    /**
     * Should only be called from within this class,
     * but AS does not support private constructors.
     */
    function Globals(view:RoView = null) {
        if (instance == null) {
            this.view = view;
            instance = this;
        }
    }

    private static function getInstance():Globals {
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
        getStatusBar().user.text = user;
    }

    public static function getStatusBar():RoStatusBar {
        return getView().getStatusBar();
    }

    public static function addListTab(objectList:ObjectList):void {
        getView().getTabs().addListTab(objectList);
    }

    //convenience method
    public static function displayList():void {
        addListTab(getList());
    }

    public static function addObjectTab(oa:ObjectAdapter):void {
        getView().getTabs().addObjectTab(oa);
    }

    private function getMenuBar():RoMenuBar {
        return getView().getMenuBar();
    }

    public static function amendMenu(menu:Menu):void {
        getInstance().getMenuBar().amend(menu);
    }

    public static function dockView(tab:IDockable): void {
        getView().getDock().addView(tab);
    }

    public static function getMenu():Menu {
        return getInstance().getMenuBar().getMenu();
    }

    public static function setMenu(menu:Menu):void {
        getInstance().getMenuBar().setMenu(menu);
    }

    public static function getList():ObjectList {
        if (getInstance().list == null) {
            getInstance().list = new ObjectList();
        }
        return getInstance().list;
    }

    public static function setList(list:ObjectList):void {
        getInstance().list = list;
    }

    public static function getCredentials():String {
        var credentials:String = getInstance().user + ":" + getInstance().pw;
        var encoder:Base64Encoder = new Base64Encoder();
        encoder.insertNewLines = false;
        encoder.encode(credentials);
        credentials = encoder.toString();
        return credentials;
    }

    // delegate to EventLog
    public static function logFault(url:String, faultString:String):void {
        getInstance().log.fault(url, faultString);
    }

    public static function logStart(url:String, method:String, body:String):void {
        getInstance().log.start(url, method, body);
    }

    public static function logEnd(url:String, jsonString:String):LogEntry {
        return getInstance().log.end(url, jsonString);
    }

    public static function logFind(url:String):LogEntry {
        return getInstance().log.find(url);
    }

    public static function logReset():void {
        getInstance().log.reset();
    }

    public static function logEntries():Vector.<LogEntry> {
        return getInstance().log.getEntries();
    }

    public static function logShowAll():void {
        getInstance().log.showAll();
    }

    public static function logStartTime():uint {
        return getInstance().log.getLogStartTime();
    }

    public static function logAdd(title:String):void {
        getInstance().log.add(title)
    }

    // delegate to HandlerChain
    public static function dspHandle(logEntry:LogEntry):void {
        getInstance().dsp.handle(logEntry);
    }

    // delegate to Tabs
    public static function addEventTab():void {
        var list:Vector.<LogEntry> = getInstance().log.getEntries();
        getView().getTabs().addEventTab(list);
    }

    public static function addTreeTab():void {
        var list:Vector.<LogEntry> = getInstance().log.getEntries();
        getInstance().view.getTabs().addTreeTab(list);
    }

    // delegate to ObjectList
    public static function setListLayout(l:Layout):void {
        getList().setLayout(l);
    }

    public static function toggleDock(toggle:Boolean):void {
        getView().showDock(toggle);
    }

    public static function toggleStatus(toggle:Boolean):void {
        getView().showStatus(toggle);
    }

    public static function getView():RoView {
        return getInstance().getView();
    }
    
}
}
