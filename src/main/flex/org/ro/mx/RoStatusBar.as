package org.ro.mx {

import flash.events.MouseEvent;

import mx.collections.ArrayCollection;
import mx.containers.HBox;
import mx.controls.Button;
import mx.controls.Label;
import mx.controls.LinkButton;
import mx.core.FlexGlobals;

import org.ro.xhr.XhrLog;

public class RoStatusBar extends HBox {

    [Embed('../../../../resources/images/history.svg')]
    [Bindable]
    public var LogIcon:Class;

    private var statusIcon:LinkButton = new LinkButton();
    public var url:Label = new Label();
    public var duration:Label = new Label();
    public var user:Label = new Label();
    public var host:Label = new Label();

    public function RoStatusBar() {
        percentWidth = 100;
        height = 20;
        
        statusIcon.width = 16;
        statusIcon.height = 16;
        statusIcon.enabled = false;

        addChild(statusIcon);
        addChild(url);
        addChild(duration);
        addChild(host);
        addChild(user);

        addEventListener(MouseEvent.CLICK, clickHandler);
    }
    
    public function setIcon(cls:Class):void {
        statusIcon.setStyle("icon", cls);
    }

    public function clickHandler(event:MouseEvent):void {
        var view:RoView = FlexGlobals.topLevelApplication.view;
        var log:XhrLog = view.dsp.log;
        var list:ArrayCollection = log.getEntries();
        view.body.addTab(list, "Log Enties (" + list.length + ")", LogIcon);
    }

}
}
