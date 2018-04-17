package org.ro.handler {
import org.ro.core.Globals;
import org.ro.core.ObjectList;
import org.ro.mx.ImageRepository;
import org.ro.to.Invokeable;
import org.ro.to.TObject;

public class TObjectHandler extends AbstractHandler implements IHandler {

    public function TObjectHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        var answer:Boolean = hasMembers(jsonObj) && !isService(jsonObj);
        return answer;
    }

    public override function doHandle(jsonObj:Object):void {
        var list:ObjectList = getObjectList();
        var to:TObject = new TObject(jsonObj);
        if (isLayoutToBeSet(list)) {
            to.getLayoutLink().invoke();
        }

        var objProps:Vector.<Invokeable> = to.getProperties();
        list.addObject(objProps);

        //TODO FEATURE Open tab immediately and append entries, have title reflect increasing numbers (n/limit)
        if (list.isReadyForDisplay()) {
            var title:String = to.getDomainType() + " (" + list.length() + ")";
            Globals.getInstance().addTab(list, title, ImageRepository.ObjectsIcon);
        }

        function isLayoutToBeSet(list:ObjectList):Boolean {
            if ((list == null) ||
                    list.hasLayout()) {
                return false;
            } else {
                return true;
            }
        }
    }


}
}
