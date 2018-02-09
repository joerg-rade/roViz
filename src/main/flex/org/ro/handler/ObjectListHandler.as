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
        var objProps:Vector.<IInvokeable> = Member.filterProperties(memberList);
        getObjectList().addObject(objProps);
        if (getObjectList().isFilled()) {
            // TODO retrieve layout.xml of the first object and pass in as well - must be triggered on initial call 
            var objColl:ArrayCollection = getObjectList().forDataGrid();
            Globals.addTab(objColl, domainType + " (" + objColl.length + ")", ImageRepository.ObjectsIcon);
        }
    }

}
}