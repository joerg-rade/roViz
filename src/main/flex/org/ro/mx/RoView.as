package org.ro.mx {

import org.ro.ctrl.Dispatcher;

import spark.components.VGroup;

public class RoView extends VGroup {

    public var dsp:Dispatcher;
    public var menuBar:RoMenuBar;
    public var body:RoTabBar;
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
        body = new RoTabBar();
        this.addElement(body);
        statusBar = new RoStatusBar();
        this.addElement(statusBar);
    }
}
}