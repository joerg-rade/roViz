package org.ro.handler {
import mx.controls.Alert;

public class DefaultHandler extends AbstractHandler implements IResponseHandler {

    public function DefaultHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        return true;
    }

    public override function doHandle(jsonObj:Object):void {
        var s:String = JSON.stringify(jsonObj, null, 4);
//        Alert.show(s, "No Handler found for: " + logEntry.url);
        trace("No Handler found for: " + logEntry.url);
    }

}
}
