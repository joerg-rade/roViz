package org.ro.handler {

public class DefaultHandler extends AbstractHandler implements IResponseHandler {

    public function DefaultHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        return true;
    }

    public override function doHandle(jsonObj:Object):void {
        if (null == jsonObj) {
            trace("json null for: " + logEntry.url);
        } else {
            trace("No Handler found for: " + logEntry.url);
        }
    }

}
}
