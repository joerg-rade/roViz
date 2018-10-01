package org.ro.core.event {
import org.ro.core.DisplayManager;
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
    private static var instance:EventLog = null;

    private var log:Vector.<LogEntry> = new Vector.<LogEntry>();
    public var logStart:Date = new Date();

    // Should not be called from the outside, but ActionScript does not allow private constructors
    function EventLog() {
    }

    public static function getInstance():EventLog {
        if (instance == null) {
            instance = new EventLog();
        }
        return instance;
    }

    public function start(url:String, method:String, body:String, obs:ILogEventObserver = null):LogEntry {
        var entry:LogEntry = new LogEntry(url, method, body);
        entry.observer = obs;
        log.push(entry);
        DisplayManager.updateStatus(entry);
        return entry;
    }

    public function add(description:String):void {
        var entry:LogEntry = LogEntry.create(description);
        entry.createdAt = new Date();
        log.push(entry);
        DisplayManager.updateStatus(entry);
    }

    public function update(description:String):LogEntry {
        var entry:LogEntry = find(description);
        entry.updatedAt = new Date();
        return entry;
    }

    public function end(url:String, response:String):LogEntry {
        var entry:LogEntry = find(url);
        entry.setSuccess(response);
        DisplayManager.updateStatus(entry);
        return entry;
    }

    public function fault(url:String, fault:String):void {
        var entry:LogEntry = find(url);
        entry.setError(fault);
        DisplayManager.updateStatus(entry);
    }

    /**
     * Answers the first matching entry.
     * @param url
     * @return
     */
    public function find(url:String):LogEntry {
        var le:LogEntry = null;
        if (Utils.endsWith(url, "object-layout") || url.indexOf("/properties/") > 0) {
            le = findSimilar(url);
        } else {
            le = findExact(url);
        }
        return le;
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
    
    public function isCached(url:String):Boolean {
        var le:LogEntry = find(url);
        if ((le != null) && (le.hasResponse() || le.isView())) {
            le.retrieveResponse();
            Globals.dispatcher.handle(le);
            return true;
        }
        return false;
    }

}
}
