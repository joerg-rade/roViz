package org.ro.handler {
import org.ro.core.Globals;
import org.ro.core.ObjectAdapter;
import org.ro.core.ObjectList;
import org.ro.to.Invokeable;
import org.ro.to.TObject;
import org.ro.view.ImageRepository;

public class TObjectHandler extends AbstractHandler implements IHandler {

    public override function canHandle(jsonObj:Object):Boolean {
        var answer:Boolean = hasMembers(jsonObj) && !isService(jsonObj);
        return answer;
    }

    public override function doHandle(jsonObj:Object):void {
        var list:ObjectList = getObjectList();
        var tObj:TObject = new TObject(jsonObj);
        if (!list.hasLayout()) {
            tObj.getLayoutLink().invoke();
        }

        var objProps:Vector.<Invokeable> = tObj.getProperties();
        var o:TObject = TObject.createObject(objProps);
        var oa:ObjectAdapter = new ObjectAdapter(o);
        if (list.isFull()) {
 //           Alert.show("extra element");
            Globals.getInstance().addObjectTab(o);
        } else {
            list.add(oa);
            logEntry.tObject = o;
        }

        //TODO FEATURE Open tab immediately and append entries, have title reflect increasing numbers (n/limit)
        if (list.isReadyForDisplay()) {
            var title:String = tObj.getDomainType() + " (" + list.length() + ")";
            Globals.getInstance().addListTab(list, title, ImageRepository.ObjectsIcon);
        }
    }

}
}
