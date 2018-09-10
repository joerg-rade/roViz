package org.ro.core.event {
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.http.mxml.HTTPService;

import org.ro.core.Globals;
import org.ro.to.Invokeable;
import org.ro.to.Link;

/**
 * The name is somewhat misleading, see: https://en.wikipedia.org/wiki/XMLHttpRequest
 */
public class XmlHttpRequest extends HTTPService {

    protected function xhrFaultHandler(event:FaultEvent):void {
        Globals.logFault(url, event.fault.faultString);
    }

    protected function xhrResultHandler(event:ResultEvent):void {
        var jsonString:String = event.result.toString();
        var logEntry:LogEntry = Globals.logEnd(url, jsonString);
        Globals.dspHandle(logEntry);
    }

    public function XmlHttpRequest() {
        super.useProxy = false;
        addEventListener(FaultEvent.FAULT, xhrFaultHandler);
        addEventListener(ResultEvent.RESULT, xhrResultHandler);
    }

    public function invoke(inv:Invokeable):void {
        cancel();
        super.url = inv.getHref();
        if (isCached(url))
            return;
        super.method = inv.getMethod();
        var credentials:String = Globals.getCredentials();
        super.headers = {Authorization: "Basic " + credentials};
        super.headers["Accept"] = "application/json";
        super.contentType = "application/json";
        if (super.method == Invokeable.POST) {
            var l:Link = inv as Link;
            var body:String = l.getArgumentsAsJsonString();
            send(body);
        } else {
            send();
        }
        Globals.logStart(url, method, body);
    }

    private static function isCached(url:String):Boolean {
        var le:LogEntry = Globals.logFind(url);
        if ((le != null) && (le.hasResponse())) {
            le.retrieveResponse();
            Globals.dspHandle(le);
            return true;
        }
        return false;
    }

}
}
