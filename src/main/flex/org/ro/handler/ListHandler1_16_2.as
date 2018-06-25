package org.ro.handler {
import org.ro.core.Globals;
import org.ro.core.ObjectList;
import org.ro.to.Link;
import org.ro.to.List;

public class ListHandler1_16_2 extends AbstractHandler implements IResponseHandler {
    public function ListHandler1_16_2() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        var v:Object = jsonObj.value;
        if ((v == null) || isEmptyObject(v)) {
            return false;
        }
        if (v is Array) {
            var va:Array = v as Array;
            return va.length > 0;
        } else {
            return false;
        }
    }

    public override function doHandle(jsonObj:Object):void {
        var list:List = new List(jsonObj);
        var members:Vector.<Link> = list.getValues();
        var size:uint = members.length;
        var objectList:ObjectList = new ObjectList(size);
        Globals.getInstance().setList(objectList);
        for each (var l:Link in members) {
            l.invoke();
        }
    }

}
}
