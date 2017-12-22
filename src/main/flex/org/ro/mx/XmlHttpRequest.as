package org.ro.mx {

import mx.controls.Alert;
import mx.core.FlexGlobals;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.http.mxml.HTTPService;

import org.ro.to.IInvokeable;

public class XmlHttpRequest extends HTTPService {

    protected function xhrFaultHandler(event:FaultEvent):void {
        Alert.show("XHR Fault");
    }

    protected function xhrResultHandler(event:ResultEvent):void {
        var jsonObj:Object = JSON.parse(event.result.toString());
        FlexGlobals.topLevelApplication.view.dsp.handle(jsonObj);
    }

    public function XmlHttpRequest() {
        useProxy = false;
        addEventListener(FaultEvent.FAULT, xhrFaultHandler);
        addEventListener(ResultEvent.RESULT, xhrResultHandler);
    }

    public function invoke(inv:IInvokeable):void {
        cancel();
        var credentials:String = FlexGlobals.topLevelApplication.view.dsp.credentials;
        headers = {Authorization: "Basic " + credentials};
        url = inv.getHref();
        method = inv.getMethod();
        send();
    }

}
}
