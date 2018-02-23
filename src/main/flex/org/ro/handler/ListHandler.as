package org.ro.handler {
import org.ro.core.ObjectList;
import org.ro.to.Invokeable;
import org.ro.to.Link;
import org.ro.to.List;

public class ListHandler extends AbstractHandler implements IHandler {
    public function ListHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        var result:Object = jsonObj.result;
        if (result === null) {
            return false;
        }
        var value:Array = result.value;
        if (value === null) {
            return false;
        }
        return value.length > 0;
    }

    public override function doHandle(jsonObj:Object):void {
        var list:List = new List(jsonObj);
        var members:Vector.<Invokeable> = list.getResult().getValues();
        setObjectList(new ObjectList(members.length));
        for each (var l:Link in members) {
            l.invoke();
        }
    }

}
}
