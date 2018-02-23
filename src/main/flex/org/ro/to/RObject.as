package org.ro.to {
import org.ro.core.StringUtils;

public class RObject extends TitledTO {
    internal var domainType:String;
    internal var instanceId:uint;

    public function RObject(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    override protected function init():void {
        super.init();
    }

    //TODO evemtually pull up
    public function getLayoutLink():Link {
        for each(var l:Link in linkList) {
            if (StringUtils.endsWith(l.getHref(), "object-layout")) {
                return l;
            }
        }
        return null;
    }

    public function getDomainType():String {
        return this.domainType;
    }

}
}
