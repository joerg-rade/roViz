package org.ro.mx {

import mx.controls.Alert;
import mx.core.FlexGlobals;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.http.mxml.HTTPService;

import org.ro.ctrl.Dispatcher;
import org.ro.to.IInvokeable;
import org.ro.xhr.XhrLog;

public class XmlHttpRequest extends HTTPService {

    protected function xhrFaultHandler(event:FaultEvent):void {
        getLog().fault(url, event.fault.faultString);
//TODO remove Alert
        Alert.show("XHR Fault");
    }

    protected function xhrResultHandler(event:ResultEvent):void {
        var jsonObj:Object = JSON.parse(event.result.toString());
        var size:int = new String(jsonObj).length;
        getLog().end(url, size);
        getDsp().handle(jsonObj);
    }

    public function XmlHttpRequest() {
        super.useProxy = false;
        addEventListener(FaultEvent.FAULT, xhrFaultHandler);
        addEventListener(ResultEvent.RESULT, xhrResultHandler);
    }

    public function invoke(inv:IInvokeable):void {
        cancel();
        var credentials:String = getDsp().credentials;
        super.headers = {Authorization: "Basic " + credentials};
        super.url = inv.getHref();
        super.method = inv.getMethod();
        getLog().start(url);
        send();
    }

    private function getLog():XhrLog {
        return getDsp().log;
    }

    private function getDsp():Dispatcher {
        return FlexGlobals.topLevelApplication.view.dsp;
    }

}
}