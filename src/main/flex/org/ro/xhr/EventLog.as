package org.ro.xhr {
import org.ro.core.Globals;

public class EventLog {

    private var log:Vector.<LogEntry>;
    public var logStart:Date = new Date();

    public function EventLog() {
        log = new Vector.<LogEntry>();
        logStart = new Date();
    }

    /**
     * iterate over entries and set logstart to ts of first visible
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

    public function start(url:String, method:String, body:String):LogEntry {
        var entry:LogEntry = new LogEntry(url, method, body);
        log.push(entry);
        updateStatus(entry);
        return entry;
    }

    public function add(description:String):void {
        var entry:LogEntry = LogEntry.create(description);
        log.push(entry);
        updateStatus(entry);
    }

    public function end(url:String, response:String):LogEntry {
        var entry:LogEntry = find(url);
        entry.setSuccess(response);
        updateStatus(entry);
        return entry;
    }

    private static function updateStatus(entry:LogEntry):void {
        Globals.getInstance().getStatusBar().update(entry);
    }

    public function fault(url:String, fault:String):void {
        var entry:LogEntry = find(url);
        entry.setError(fault);
        updateStatus(entry);
    }

    /**
     * Answers the first matching entry.
     * @param url
     * @return
     */
    public function find(url:String):LogEntry {
        var answer:LogEntry = null;
        for each(var le:LogEntry in log) {
            // assumes urls are unique !
            if (le.url == url) {
                answer = le;
                break;
            }
        }
        return answer;
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

    public function isResponsePending():Boolean {
        //iterate over all entries and chek for outstanding responses
        // url must be unique in list
        var pending:Vector.<LogEntry> = new Vector.<LogEntry>();
        for each (var ple:LogEntry in log) {
            if (ple.updatedAt == null) {
                pending.push(ple);
            }
        }
        var entriesWithUrl:Vector.<LogEntry>;
        for each (var pe:LogEntry in pending) {
            entriesWithUrl = collect(pe.url);
            if (entriesWithUrl.length > 1) {
                return true;
            }
        }
        return false;

        function collect(url:String):Vector.<LogEntry> {
            var answer:Vector.<LogEntry> = new Vector.<LogEntry>();
            for each(var l:LogEntry in log) {
                if (l.url == url) {
                    answer.push(l);
                }
            }
            return answer;
        }
    }

}
}
