package org.ro.xhr {
import flash.display.Bitmap;

import mx.collections.ArrayCollection;
import mx.controls.Button;
import mx.controls.Image;
import mx.core.FlexGlobals;

import org.ro.mx.RoStatusBar;

public class XhrLog {
    [Embed('../../../../resources/images/check-circle.svg')]
    [Bindable]
    public var greenIcon:Class;
    [Embed('../../../../resources/images/question-circle.svg')]
    [Bindable]
    public var yellowIcon:Class;
    [Embed('../../../../resources/images/times-circle.svg')]
    [Bindable]
    public var redIcon:Class;

    private var log:ArrayCollection;

    public function XhrLog() {
        clear();
    }

    public function start(url:String):void {
        var entry:XhrLogEntry = new XhrLogEntry();
        entry.url = url;
        entry.start = new Date();
        entry.icon = yellowIcon;
        log.addItem(entry);
    }

    public function end(url:String, size:int):void {
        var entry:XhrLogEntry = find(url);
        var duration:int = new Date().getMilliseconds() - entry.start.getMilliseconds();
        entry.duration = duration;
        entry.size = size;
        entry.icon = greenIcon;
        updateStatus(entry);
    }

    private function updateStatus(entry:XhrLogEntry):void {
        var statusBar:RoStatusBar = FlexGlobals.topLevelApplication.view.statusBar;
        statusBar.url.text = entry.url;
        statusBar.duration.text = entry.duration + "ms";
        statusBar.setIcon(entry.icon);
    }

    public function fault(url:String, fault:String):void {
        var entry:XhrLogEntry = find(url);
        var duration:int = new Date().getMilliseconds() - entry.start.getMilliseconds();
        entry.duration = duration;
        entry.fault = fault;
        entry.icon = redIcon;
        updateStatus(entry);
    }

    private function find(url:String):XhrLogEntry {
        for each(var le:XhrLogEntry in log) {
            if (le.url == url) return le;
        }
        return null;
    }

    public function clear():void {
        log = new ArrayCollection();
    }

    public function getEntries():ArrayCollection {
        return log;
    }
}
}
