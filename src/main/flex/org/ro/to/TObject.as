package org.ro.to {
import org.ro.core.Adaptable;
import org.ro.core.Utils;

dynamic public class TObject extends TitledTO implements Adaptable {
    public var domainType:String;
    public var instanceId:uint;

    public function TObject(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromJSON(jsonObj);
            init();
        }
    }

    override protected function init():void {
        super.init();
    }

    //TODO eventually pull up
    public function getLayoutLink():Link {
        for each(var l:Link in linkList) {
            //TODO can be "object-layout" >= 1.16
            if (Utils.endsWith(l.getHref(), "layout")) {
                return l;
            }
        }
        return null;
    }

    public function getDomainType():String {
        return this.domainType;
    }

    public function getProperties():Vector.<Invokeable> {
        var result:Vector.<Invokeable> = new Vector.<Invokeable>();
        for each(var m:Member in memberList) {
            if (m.memberType == Member.PROPERTY) {
                result.push(m);
            }
        }
        return result;
    }


}
}
