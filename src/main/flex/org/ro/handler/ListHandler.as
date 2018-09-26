package org.ro.handler {
import org.ro.core.event.ListObserver;
import org.ro.to.Invokeable;
import org.ro.to.Link;
import org.ro.to.List;

public class ListHandler extends AbstractHandler implements IResponseHandler {
    public function ListHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        var r:Object = jsonObj.result;
        if (r == null) {
            return false;
        }
        // Prototyping#openRestApi
        if (r.value == "http:/restful/") {
            return false;
        }
        var v:Array = r.value;
        if (v == null) {
            return false;
        }
        return v.length > 0;
    }

    public override function doHandle(jsonObj:Object):void {
        var list:List = new List(jsonObj);
        logEntry.object = list;
        var lo:ListObserver = logEntry.initListObserver();
        lo.update(logEntry);
        var members:Vector.<Invokeable> = list.getResult().getValues();
        for each (var l:Link in members) {
            l.invoke(lo);
        }
    }

}
}
