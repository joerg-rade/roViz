package org.ro.handler {
import mx.collections.ArrayCollection;

import org.ro.core.Globals;
import org.ro.mx.ImageRepository;
import org.ro.to.IInvokeable;
import org.ro.to.Member;

public class ObjectListHandler extends AbstractHandler implements IHandler {

    public function ObjectListHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        //return (jsonObj.resulttype != null && jsonObj.resulttype === "list");
        // TODO in case of an empty list no tab is opened, no message displayed though ...
        return (jsonObj.members != null) && (!jsonObj.extensions.isService);
    }

    public override function doHandle(jsonObj:Object):void {
        var domainType:String = jsonObj.domainType;
        var memberList:Vector.<IInvokeable> = Member.parse(jsonObj.members);
        var properties:Vector.<IInvokeable> = Member.filterProperties(memberList);
        var done:Boolean = getObjectList().init(properties);
        if (done) {
            var objectList:ArrayCollection = new ArrayCollection(getObjectList().list);
            Globals.addTab(objectList, domainType + " (" + objectList.length + ")", ImageRepository.ObjectsIcon);
        }
    }

}
}