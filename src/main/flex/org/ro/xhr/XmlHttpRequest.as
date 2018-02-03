package org.ro.xhr {

import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.http.mxml.HTTPService;

import org.ro.core.Globals;
import org.ro.to.AbstractTransferObject;
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
        getLog().end(url, jsonString);
        Globals.getDsp().handle(jsonObj);
    }

    public function XmlHttpRequest() {
        super.useProxy = false;
        addEventListener(FaultEvent.FAULT, xhrFaultHandler);
        addEventListener(ResultEvent.RESULT, xhrResultHandler);
    }

    public function invoke(inv:IInvokeable):void {
        cancel();
        super.url = inv.getHref();
        super.method = inv.getMethod();
        var credentials:String = Globals.getDsp().credentials;
        super.headers = {Authorization: "Basic " + credentials};
        super.headers["Accept"] = "application/json";
        super.contentType = "application/json";
        var len:uint = 0;
        if (super.method == AbstractTransferObject.POST) {
            var body:String = getBody(inv);
            len = body.length;
            send(body);
        } else {
            send();
        }
        getLog().start(url, method, len);
    }

    private function getBody(inv:IInvokeable):String {
        var obj:Object = inv.getArguments();
        var jsonString:String = JSON.stringify(obj);
        return jsonString;
    }

    private static function getLog():XhrLog {
        return Globals.getDsp().log;
    }

}
}
