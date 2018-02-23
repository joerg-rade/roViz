package org.ro.xhr {
import org.ro.core.Globals;

public class RequestLog {

    private var log:Vector.<XhrLogEntry>;
    public var logStart:Date = new Date();

    public function RequestLog() {
        log = new Vector.<XhrLogEntry>();
        logStart = new Date();
    }

    /**
     * iterate over entries and set logstart to ts of first visible
     */
    public function reset():void {
        for each (var le:XhrLogEntry in log) {
            if (le.visible) {
                logStart = le.startDate;
                break;
            }
        }
        for each (var le2:XhrLogEntry in log) {
            le2.calculate();
        }
    }

    public function start(url:String, method:String, requestLength:uint):void {
        var entry:XhrLogEntry = new XhrLogEntry(url, method, requestLength);
        log.push(entry);
        updateStatus(entry);
    }

    public function end(url:String, response:String):void {
        var entry:XhrLogEntry = find(url);
        entry.setSuccess(response);
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
            // assumes urls are unique !
            if (le.url == url) return le;
        }
        return null;
    }

    public function getEntries():Vector.<XhrLogEntry> {
        return log;
    }

    public function getLogStartTime():uint {
        var first:XhrLogEntry = log[0];
        return first.start;
    }

    public function showAll():void {
        for each (var le:XhrLogEntry in log) {
            le.setVisible(true);
        }
        reset();
    }

}
}
