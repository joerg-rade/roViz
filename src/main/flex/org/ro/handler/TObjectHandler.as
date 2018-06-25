package org.ro.handler {
import org.ro.core.Globals;
import org.ro.core.model.ObjectAdapter;
import org.ro.core.model.ObjectList;
import org.ro.to.Invokeable;
import org.ro.to.Link;
import org.ro.to.TObject;

public class TObjectHandler extends AbstractHandler implements IResponseHandler {

    public override function canHandle(jsonObj:Object):Boolean {
        var answer:Boolean = hasMembers(jsonObj) && !isService(jsonObj);
        return answer;
    }

    //FIXME most of the logic should be delegated to ObjectListAdapter
    // proof: list.hasLayout
    // proof: list.isFull
    // proof: list.add
    // plus some indirect knowledge on view handling
    public override function doHandle(jsonObj:Object):void {
        var list:ObjectList = getObjectList();
        var tObj:TObject = new TObject(jsonObj);
        loadLayout(tObj);

        if (!list.hasLayout()) {
            tObj.getLayoutLink().invoke();
        }

        var objProps:Vector.<Invokeable> = tObj.getProperties();
        var o:TObject = TObject.createObject(objProps);
        var oa:ObjectAdapter = new ObjectAdapter(o);
        if (list.isFull()) {
            Globals.getInstance().addObjectTab(oa);
        } else {
            list.add(oa);
            //TODO FEATURE Open tab immediately and append entries, have title reflect increasing numbers (n/limit)
            if (list.isFull()) {
                Globals.getInstance().addListTab(list);
            }
        }
    }

    private function loadLayout(tObj:TObject):void {
        var l:Link = tObj.getLayoutLink();
        l.invoke();
    }

}
}
