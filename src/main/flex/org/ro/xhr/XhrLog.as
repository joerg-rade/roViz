package org.ro.xhr {
import mx.collections.ArrayCollection;

import org.ro.Globals;

public class XhrLog {

    private var log:ArrayCollection;
    public var logStart:Date = new Date();

    public function XhrLog() {
        clear();
    }

    private function clear():void {
        log = new ArrayCollection();
        logStart = new Date();
    }

    public function start(url:String):void {
        var entry:XhrLogEntry = new XhrLogEntry(url);
        log.addItem(entry);
        updateStatus(entry);
    }

    public function end(url:String, size:int):void {
        var entry:XhrLogEntry = find(url);
        entry.setSuccess(size);
        updateStatus(entry);
    }

    private static function updateStatus(entry:XhrLogEntry):void {
        Globals.getStatusBar().update(entry);
    }

    public function fault(url:String, fault:String):void {
        var entry:XhrLogEntry = find(url);
        entry.setError(fault);
        updateStatus(entry);
    }

    private function find(url:String):XhrLogEntry {
        for each(var le:XhrLogEntry in log) {
            if (le.url == url) return le;
        }
        return null;
    }

    public function getEntries():ArrayCollection {
        return log;
    }

    public function getLogStartTime():int {
        var first:XhrLogEntry = log[0];
        return first.start.time;
    }
}
}
