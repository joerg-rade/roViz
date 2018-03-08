package org.ro.xhr {
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.http.mxml.HTTPService;

import org.ro.core.Globals;
import org.ro.handler.Dispatcher;
import org.ro.to.Invokeable;
import org.ro.to.Link;

/**
 * The name is somewhat misleading, see: https://en.wikipedia.org/wiki/XMLHttpRequest
 */
public class XmlHttpRequest extends HTTPService {

    protected function xhrFaultHandler(event:FaultEvent):void {
        getLog().fault(url, event.fault.faultString);
    }

    protected function xhrResultHandler(event:ResultEvent):void {
        var jsonString:String = event.result.toString();
        var jsonObj:Object = JSON.parse(jsonString);
        getLog().end(url, jsonString.replace("\r\n", ""));
        getDsp().handle(jsonObj);
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
        var credentials:String = Globals.getInstance().credentials;
        super.headers = {Authorization: "Basic " + credentials};
        super.headers["Accept"] = "application/json";
        super.contentType = "application/json";
        var len:uint = 0;
        if (super.method == Invokeable.POST) {
            var l:Link = inv as Link;
            var body:String = l.getArgumentsAsJsonString();
            len = body.length;
            send(body);
        } else {
            send();
        }
        getLog().start(url, method, len);
    }

    private function isCached(url:String):Boolean {
        var le:XhrLogEntry = getLog().find(url);
        if (le != null && (le.getResponse() != null)) {
            var jsonStr:String = le.retrieveResponse();
            var json:Object = JSON.parse(jsonStr);
            getDsp().handle(json);
            return true;
        }
        return false;
    }

    private static function getDsp():Dispatcher {
        return Globals.getInstance().getDsp();
    }

    private static function getLog():RequestLog {
        return Globals.getInstance().getLog();
    }

}
}
