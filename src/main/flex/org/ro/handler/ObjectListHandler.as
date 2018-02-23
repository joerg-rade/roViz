package org.ro.handler {
import org.ro.core.Globals;
import org.ro.core.ObjectList;
import org.ro.mx.ImageRepository;
import org.ro.to.Invokeable;
import org.ro.to.RObject;

public class ObjectListHandler extends AbstractHandler implements IHandler {

    public function ObjectListHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        var answer:Boolean = (jsonObj.members != null) && (!jsonObj.extensions.isService);
        return answer;
    }

    public override function doHandle(jsonObj:Object):void {
        var ol:ObjectList = getObjectList();
        var ro:RObject = new RObject(jsonObj);
        if (ol.getLayout() === null) {
            ro.getLayoutLink().invoke();
        }

        var objProps:Vector.<Invokeable> = ro.getProperties();
        ol.addObject(objProps);

        //TODO use DataProvider class
//        if (ol.getLayout() != null) {
        if (ol.isFilled()) {
            Globals.addTab(ol, ro.getDomainType() + " (" + ol.length() + ")", ImageRepository.ObjectsIcon);
        }
    }

}
}
