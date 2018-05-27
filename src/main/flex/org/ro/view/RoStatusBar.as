package org.ro.view {

import flash.events.MouseEvent;

import mx.containers.HBox;
import mx.controls.Label;
import mx.controls.LinkButton;
import mx.controls.Spacer;

import org.ro.core.Globals;
import org.ro.xhr.EventLog;
import org.ro.xhr.LogEntry;

public class RoStatusBar extends HBox {
    private const STATUS_HEIGHT:int = 20;

    private var statusIcon:LinkButton = new LinkButton();
    public var url:Label = new Label();
    public var duration:Label = new Label();
    private var spacer:Spacer = new Spacer();
    public var user:Label = new Label();

    public function RoStatusBar() {
        percentWidth = 100;
        height = STATUS_HEIGHT;
        setStyle("paddingLeft", 4);
        statusIcon.width = 16;
        statusIcon.height = 16;
        statusIcon.enabled = false;

        addChild(statusIcon);
        addChild(url);
        addChild(duration);
        spacer.percentWidth = 100;
        addChild(spacer);
        addChild(user);

        addEventListener(MouseEvent.CLICK, clickHandler);
        toolTip = "Status of last request. Click to see history."
    }

    private function setIcon(cls:Class):void {
        statusIcon.setStyle("icon", cls);
    }

    public function update(entry:LogEntry):void {
        var href:String = entry.url;
        //limit length of URL - otherwise we get a horizontal scrollbar
        if (href == null) {
            trace(entry);
        } else {
            if (href.length > 132) {
                href = href.substr(0, 132);
            }
        }
        this.url.text = href;
        this.url.toolTip = entry.url;
        this.duration.text = entry.duration + "ms";
        this.setIcon(entry.icon);
    }

    public static function clickHandler(event:MouseEvent):void {
        var view:RoView = Globals.getInstance().getView();
        var log:EventLog = Globals.getInstance().getLog();
        var list:Vector.<LogEntry> = log.getEntries();
        view.getTabs().addGanttTab(list, "Log Entries (" + list.length + ")", ImageRepository.LogIcon);
    }

}
}
