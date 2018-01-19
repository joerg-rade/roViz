package org.ro.mx {

import org.ro.core.Dispatcher;

import spark.components.HGroup;
import spark.components.VGroup;

public class RoView extends VGroup {

    public var dsp:Dispatcher;
    public var menuBar:RoMenuBar;
    public var dock:Dock;
    public var tabs:RoTabBar;
    public var statusBar:RoStatusBar;

    public function RoView() {
        percentWidth = 100;
        percentHeight = 100;
        paddingTop = -20;
        paddingLeft = -20;
        paddingRight = -20;
        paddingBottom = -20;

        this.dsp = new Dispatcher();

        menuBar = new RoMenuBar();
        this.addElement(menuBar);

        var body:HGroup = new HGroup();
        body.percentHeight = 100;
        body.percentWidth = 100;
        dock = new Dock();
        body.addElement(dock);
        tabs = new RoTabBar();
        body.addElement(tabs);
        this.addElement(body);

        statusBar = new RoStatusBar();
        this.addElement(statusBar);
    }
}
}