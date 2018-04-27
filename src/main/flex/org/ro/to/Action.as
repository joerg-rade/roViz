package org.ro.to {
import org.ro.core.Utils;

public class Action extends Member {

    internal var parameters:Object;
    internal var parameterList:Vector.<Parameter>;
    internal var link:Object;

    public function Action(jsonObj:Object = null) {
        memberType = Member.ACTION;
        var json:Object = fixDefault(jsonObj);
        super(json);
        init();
    }

    override protected function init():void {
        super.init();
        parameterList = new Vector.<Parameter>();
        for each(var o:Object in this.parameters) {
            parameterList.push(new Parameter(o));
        }
    }

    public function getInvokeLink():Link {
        for each(var l:Link in linkList) {
            if (l.rel.indexOf(this.id) > 0) {
                return l;
            }
        }
        return null;
    }

    public function findParameterByName(name:String):Parameter {
        for each (var p:Parameter in parameterList) {
            if (p.id == name) return p;
        }
        return null;
    }

    public function getParameters():Vector.<Parameter> {
        return parameterList;
    }

    //Workaround for https://issues.apache.org/jira/browse/ISIS-1850 would break RO Spec 1.0
    private function fixDefault(json:Object):Object {
        const search:String = "\"default\":";
        const replace:String = "\"defaultChoice\":";
        return Utils.replace(json, search, replace);
    }

}
}
