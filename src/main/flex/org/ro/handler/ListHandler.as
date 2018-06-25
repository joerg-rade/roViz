package org.ro.handler {
import org.ro.core.Globals;
import org.ro.core.model.ObjectList;
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
        var members:Vector.<Invokeable> = list.getResult().getValues();
        var size:uint = members.length;
        var objectList:ObjectList = new ObjectList();
        objectList.initSize(size);
        Globals.getInstance().setList(objectList);
        for each (var l:Link in members) {
            l.invoke();
        }
    }

}
}
