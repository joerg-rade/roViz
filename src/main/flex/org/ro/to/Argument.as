package org.ro.to {
public class Argument extends AbstractTransferObject {
    internal var key:String;
    internal var value:Object;

    public function Argument(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
        }
    }
    
}
}
