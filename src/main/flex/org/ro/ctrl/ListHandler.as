package org.ro.ctrl {
import mx.collections.ArrayCollection;

import org.ro.to.Link;

public class ListHandler extends AbstractHandler implements IHandler {
    [Embed('../../../../resources/images/cubes.svg')]
    [Bindable]
    public var objectsIcon:Class;

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
        //TODO invoke for all values, collect results (cf. menu handling, services, members)
        // and open tab with list of objects
        var objectList:ArrayCollection = Link.parse(jsonObj.result.value);
        getView().body.addTab(objectList, "Objects", objectsIcon);
    }

}
}
