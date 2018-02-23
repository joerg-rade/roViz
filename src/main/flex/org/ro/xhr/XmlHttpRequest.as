package org.ro.xhr {
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
        Globals.getDsp().log.fault(url, event.fault.faultString);
    }

    protected function xhrResultHandler(event:ResultEvent):void {
        var jsonString:String = event.result.toString();
        var jsonObj:Object = JSON.parse(jsonString);
        Globals.getDsp().log.end(url, jsonString);
        Globals.getDsp().handle(jsonObj);
    }

    public function XmlHttpRequest() {
        super.useProxy = false;
        addEventListener(FaultEvent.FAULT, xhrFaultHandler);
        addEventListener(ResultEvent.RESULT, xhrResultHandler);
    }

    public function invoke(inv:Invokeable):void {
        cancel();
        super.url = inv.getHref();
        super.method = inv.getMethod();
        var credentials:String = Globals.getDsp().credentials;
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
        Globals.getDsp().log.start(url, method, len);
    }

}
}
