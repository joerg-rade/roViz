package org.ro.xhr {

import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.http.mxml.HTTPService;

import org.ro.core.Globals;
import org.ro.to.IInvokeable;

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
        getLog().end(url, jsonString.length);
        Globals.getDsp().handle(jsonObj);
    }

    public function XmlHttpRequest() {
        super.useProxy = false;
        addEventListener(FaultEvent.FAULT, xhrFaultHandler);
        addEventListener(ResultEvent.RESULT, xhrResultHandler);
    }

    public function invoke(inv:IInvokeable):void {
        cancel();
        var credentials:String = Globals.getDsp().credentials;
        super.headers = {Authorization: "Basic " + credentials};
        super.url = inv.getHref();
        super.method = inv.getMethod();
        getLog().start(url);
        send();
    }

    private function getLog():XhrLog {
        return Globals.getDsp().log;
    }

}
}