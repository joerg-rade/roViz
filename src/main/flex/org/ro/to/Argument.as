package org.ro.to {
public class Argument extends BaseTO {

    internal var key:String;
    internal var value:Object;

    public function Argument(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromJSON(jsonObj);
        }
    }

}
}
