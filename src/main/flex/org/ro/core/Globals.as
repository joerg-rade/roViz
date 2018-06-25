package org.ro.core {
import mx.utils.Base64Encoder;

import org.ro.core.event.EventLog;
import org.ro.core.event.LogEntry;
import org.ro.core.model.ObjectAdapter;
import org.ro.core.model.ObjectList;
import org.ro.handler.Dispatcher;
import org.ro.to.TObject;
import org.ro.view.Dock;
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

    //TODO should be private
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

    public function getStatusBar():RoStatusBar {
        return getView().getStatusBar();
    }

    public function addListTab(objectList:ObjectList):void {
        getView().getTabs().addListTab(objectList);
    }

    //convenience method
    public function displayList():void {
        addListTab(getList());
    }

    public function addObjectTab(oa:ObjectAdapter):void {
        getView().getTabs().addObjectTab(oa);
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

    // delegate to EventLog
    public function logFault(url:String, faultString:String):void {
        log.fault(url, faultString);
    }

    public function logStart(url:String, method:String, body:String):void {
        log.start(url, method, body);
    }

    public function logEnd(url:String, jsonString:String):LogEntry {
        return log.end(url, jsonString);
    }

    public function logFind(url:String):LogEntry {
        return log.find(url);
    }

    public function logReset():void {
        log.reset();
    }

    public function logEntries():Vector.<LogEntry> {
        return log.getEntries();
    }

    public function logShowAll():void {
        log.showAll();
    }

    public function logStartTime():uint {
        return log.getLogStartTime();
    }

    public function logAdd(title:String):void {
        log.add(title)
    }

    // delegate to HandlerChain
    public function dspHandle(logEntry:LogEntry):void {
        dsp.handle(logEntry);
    }

    // delegate to Tabs
    public function addEventTab():void {
        var list:Vector.<LogEntry> = log.getEntries();
        view.getTabs().addEventTab(list);
    }

    public function addTreeTab():void {
        var list:Vector.<LogEntry> = log.getEntries();
        view.getTabs().addTreeTab(list);
    }

}
}
