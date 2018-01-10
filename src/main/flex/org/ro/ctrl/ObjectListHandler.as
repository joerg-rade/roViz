package org.ro.ctrl {
import mx.collections.ArrayCollection;

import org.ro.mx.IconRepository;
import org.ro.to.Member;

public class ObjectListHandler extends AbstractHandler implements IHandler {
    
    public function ObjectListHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        //return (jsonObj.resulttype != null && jsonObj.resulttype === "list");
        return (jsonObj.members != null) && (!jsonObj.extensions.isService);
    }

    public override function doHandle(jsonObj:Object):void {
        var domainType:String = jsonObj.domainType;
        var members:ArrayCollection = Member.parse(jsonObj.members);
        var properties:ArrayCollection = Member.filterProperties(members);
        var done:Boolean = getObjectList().init(properties);
        if (done) {
            var objectList:ArrayCollection = new ArrayCollection(getObjectList().list);
            getView().body.addTab(objectList, domainType + " (" + objectList.length + ")", IconRepository.ObjectsIcon);
        }
    }

}
}