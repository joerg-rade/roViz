package org.ro.handler {
import org.ro.core.Globals;
import org.ro.to.TObject;

public class TObjectHandler extends AbstractHandler implements IResponseHandler {

    public override function canHandle(jsonObj:Object):Boolean {
        var answer:Boolean = hasMembers(jsonObj) && !isService(jsonObj);
        return answer;
    }

    public override function doHandle(jsonObj:Object):void {
        var tObj:TObject = new TObject(jsonObj);
        logEntry.object = tObj;
    }

}
}
