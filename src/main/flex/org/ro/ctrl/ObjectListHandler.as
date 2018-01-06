package org.ro.ctrl {
import mx.collections.ArrayCollection;

import org.ro.to.Member;

public class ObjectListHandler extends AbstractHandler implements IHandler {
    [Embed('../../../../resources/images/cubes.svg')]
    [Bindable]
    public var objectsIcon:Class;

    public function ObjectListHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        return (jsonObj.members != null) && (!jsonObj.extensions.isService);
    }

    public override function doHandle(jsonObj:Object):void {
        var type:String = jsonObj.domainType;
        var members:ArrayCollection = Member.parse(jsonObj.members);
        var properties:ArrayCollection = Member.filterProperties(members);
        var done:Boolean = getObjectList().init(properties);
        if (done) {
            var objectList:ArrayCollection = new ArrayCollection(getObjectList().list);
            getView().body.addTab(objectList, type + " (" + objectList.length + ")", objectsIcon);
        }
    }

}
}