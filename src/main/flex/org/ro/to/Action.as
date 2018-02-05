package org.ro.to {
public class Action extends Member {

    internal var parameters:Object;
    public var parameterList:Vector.<Parameter>;

    public function Action(jsonObj:Object = null) {
        memberType = Member.ACTION;
        var json:Object = fixDefault(jsonObj);
        super(json);
        init();
    }

    private function init():void {
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
    
    //Workaround for https://issues.apache.org/jira/browse/ISIS-1850 would break RO Spec 1.0
    private function fixDefault(json:Object):Object {
        var origin:String = JSON.stringify(json);
        if (origin.indexOf("\"default\":") > 0) {
            var answer:String = origin.replace(/"default":/, "\"defaultChoice\":");
            return JSON.parse(answer);
        }
        return json;
    }

}
}
