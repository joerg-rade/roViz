package org.ro.handler {
import mx.controls.Alert;

public class DefaultHandler extends AbstractHandler implements IResponseHandler {

    public function DefaultHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        return true;
    }

    public override function doHandle(jsonObj:Object):void {
        Alert.show("No Handler found for: " + jsonObj as String);
    }

}
}
