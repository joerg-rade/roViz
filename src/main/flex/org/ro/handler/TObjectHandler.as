package org.ro.handler {
import org.ro.core.Globals;
import org.ro.core.ObjectList;
import org.ro.view.ImageRepository;
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
        var tObj:TObject = new TObject(jsonObj);
        if (isLayoutToBeSet(list)) {
            tObj.getLayoutLink().invoke();
        }

        var objProps:Vector.<Invokeable> = tObj.getProperties();
        list.addObject(objProps);

        //TODO FEATURE Open tab immediately and append entries, have title reflect increasing numbers (n/limit)
        if (list.isReadyForDisplay()) {
            var title:String = tObj.getDomainType() + " (" + list.length() + ")";
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
