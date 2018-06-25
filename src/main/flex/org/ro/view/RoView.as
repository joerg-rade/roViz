package org.ro.view {
import org.ro.core.Globals;
import org.ro.view.tab.RoTabBar;

import spark.components.HGroup;
import spark.components.VGroup;

public class RoView extends VGroup {
    private const PADDING:int = -24;

    private var menuBar:RoMenuBar;
    private var dock:Dock;
    private var tabs:RoTabBar;
    private var statusBar:RoStatusBar;
    private var body:HGroup;

    public function RoView() {
        percentWidth = 100;
        percentHeight = 100;
        paddingTop = PADDING;
        paddingLeft = PADDING;
        paddingRight = PADDING;
        paddingBottom = PADDING;

        initMenu();
        initBody();
        initStatus();
        new Globals(this);
    }

    private function initMenu():void {
        menuBar = new RoMenuBar();
        this.addElement(menuBar);
    }

    private function initBody():void {
        body = new HGroup();
        body.percentHeight = 100;
        body.percentWidth = 100;
        this.addElement(body);

 //       initDock();
        initTabs();
    }

    private function initDock():void {
        dock = new Dock();
        body.addElementAt(dock, 0);
    }

    private function initTabs():void {
        tabs = new RoTabBar();
        body.addElement(tabs);
    }

    private function initStatus():void {
        statusBar = new RoStatusBar();
        this.addElement(statusBar);
    }

    public function showDock(toggle:Boolean):void {
        if (toggle) {
            initDock();
        } else {
            body.removeChild(dock);
            body.invalidateDisplayList();
        }
    }

    public function showStatus(toggle:Boolean):void {
        if (toggle) {
            initStatus();
        } else {
            this.removeChild(statusBar);
            this.invalidateDisplayList();
        }
    }

    public function getTabs():RoTabBar {
        return tabs;
    }

    public function getMenuBar():RoMenuBar {
        return menuBar;
    }

    public function getStatusBar():RoStatusBar {
        return statusBar;
    }

    public function getDock():Dock {
        return dock;
    }

}
}
