package org.ro.utils {
import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.http.mxml.HTTPService;

public class FileReader {
    public function FileReader() {
    }

    public function loadMenu(fileName:String):void {
        var s:HTTPService = new HTTPService(fileName);
        s.resultFormat = "e4x";
        s.useProxy = true;
        s.addEventListener(FaultEvent.FAULT, serviceFault);
        s.addEventListener(ResultEvent.RESULT, serviceResult);
        s.send();
    }

    private function serviceResult(evt:ResultEvent):void {
        var xml:XML = evt.result as XML;
        dataProvider = xml;
    }

    private static function serviceFault(evt:FaultEvent):void {
        var title:String = evt.type + " (" + evt.fault.faultCode + ")";
        var text:String = evt.fault.faultString;
        Alert.show(text, title);
    }
    
}
}
