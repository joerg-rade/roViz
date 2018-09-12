package org.ro.core.event {
import org.ro.core.Globals;
import org.ro.core.Utils;
import org.ro.core.model.ObjectAdapter;
import org.ro.core.model.ObjectList;
import org.ro.layout.Layout;

//TODO how can be determined, which observer should be assigned to LE?
// where should this take place? I ResponseHandler? In LE?
//FIXME DisplayManager to be refactored 
public class ListObserver implements ILogEventObserver {

    private var listUrl:String;
    private var list:ObjectList = new ObjectList();

    public function ListObserver(baseUrl:String) {
        this.listUrl = baseUrl;
    }

    public function update(le:LogEntry):void {
        var json:Object = Utils.toJsonObject(le.response);

        if (isList(json)) {
            list = new ObjectList();
            var size:uint = 0; //FIXME needs to be set
            list.initSize(size);
        }
        if (isObject(json)) {
            var oa:ObjectAdapter = new ObjectAdapter(le.tObject);
            list.add(oa);
        }
        if (isLayout(json)) {
            var l:Layout = new Layout(le.tObject);
            list.setLayout(l);
        }
        //TODO are list & layout the only criteria?
        if (isLayoutSet()) {
            Globals.addListTab(list); //open
        }
    }

    private function isLayoutSet():Boolean {
        return (list != null) && (list.hasLayout());
    }

    //TODO eventually move to LogEntry
    private function isList(json:Object):Boolean {
        return (json.memberType == "collection");
    }

    private function isObject(json:Object):Boolean {
        return json.hasOwnProperty("instanceId");
    }

    private function isLayout(json:Object):Boolean {
        return json.hasOwnProperty("row");
    }
}
}
