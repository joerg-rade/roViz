package org.ro.handler {
import mx.collections.ArrayCollection;

import org.ro.core.ObjectList;

import org.ro.to.Link;

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
        var members:ArrayCollection = Link.parse(jsonObj.result.value);
        setObjectList(new ObjectList(members.length));
        for each (var l:Link in members) {
            l.invoke();
        }
    }

}
}
