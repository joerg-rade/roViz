package org.ro.core.event {
import org.ro.core.Globals;
import org.ro.core.Utils;

/**
 * Keeps a log of remote invocations and the responses.
 * Subsequent invocations are served from this cache.
 *
 * @See https://en.wikipedia.org/wiki/Proxy_pattern
 */
    //TODO all invocations should go here in the first place 
public class EventLog {

    private var log:Vector.<LogEntry> = new Vector.<LogEntry>();
    public var logStart:Date = new Date();

    public function EventLog() {
    }

    /**
     * iterate over entries and set logstart to timestamp of first visible
     */
    public function reset():void {
        for each (var le:LogEntry in log) {
            if (le.visible) {
                logStart = le.createdAt;
                break;
            }
        }
        for each (var le2:LogEntry in log) {
            le2.calculate();
        }
    }

    public function start(url:String, method:String, body:String, obs:ILogEventObserver):LogEntry {
        var entry:LogEntry = new LogEntry(url, method, body);
        entry.observer = obs;
        log.push(entry);
        Globals.updateStatus(entry);
        return entry;
    }

    public function add(description:String):void {
        var entry:LogEntry = LogEntry.create(description);
        entry.createdAt = new Date();
        log.push(entry);
        Globals.updateStatus(entry);
    }

    public function update(description:String):void {
        var entry:LogEntry = find(description);
        entry.updatedAt = new Date();
    }

    public function end(url:String, response:String):LogEntry {
        var entry:LogEntry = find(url);
        entry.setSuccess(response);
        Globals.updateStatus(entry);
        return entry;
    }

    public function fault(url:String, fault:String):void {
        var entry:LogEntry = find(url);
        entry.setError(fault);
        Globals.updateStatus(entry);
    }

    /**
     * Answers the first matching entry.
     * @param url
     * @return
     */
    public function find(url:String):LogEntry {
        if (Utils.endsWith(url, "object-layout") || url.indexOf("/properties/") > 0) {
            return findSimilar(url);
        } else {
            return findExact(url);
        }
    }

    internal function findExact(url:String):LogEntry {
        for each(var le:LogEntry in log) {
            // assumes urls are unique !
            if (le.url == url) {
                trace(url);
                return le;
            }
        }
        return null;
    }

    internal function findSimilar(url:String):LogEntry {
        var argArray:Array = url.split("/");
        for each(var le:LogEntry in log) {
            var idxArray:Array = le.url.split("/");
            if (areSimilar(argArray, idxArray)) {
                trace(url);
                return le;
            }
        }
        return null;

        function areSimilar(argArray:Array, idxArray:Array, allowedDiff:uint = 1):Boolean {
            if (argArray.length != idxArray.length) {
                return false;
            }
            var diffCnt:uint = 0;
            var len:uint = argArray.length;
            var ai:String;
            var n:Number;
            var isString:Boolean;
            for (var i:uint; i <= len; i++) {
                ai = argArray[i];
                if (ai != idxArray[i]) {
                    diffCnt += 1;
                    n = Number(ai);
                    isString = isNaN(n);
                    // if the difference is a String, it is not allowed and counts double
                    if (isString) {
                        diffCnt += 1;
                    }
                }
            }
            return diffCnt <= allowedDiff;
        }
    }

    public function getEntries():Vector.<LogEntry> {
        return log;
    }

    public function getLogStartTime():uint {
        var first:LogEntry = log[0];
        return first.start;
    }

    public function showAll():void {
        for each (var le:LogEntry in log) {
            le.setVisible(true);
        }
        reset();
    }

}
}
