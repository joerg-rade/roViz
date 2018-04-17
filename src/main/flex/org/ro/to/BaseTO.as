package org.ro.to {
/**
 *  Common 'abstract' superclass of Transfer Objects.
 *  No Constructor.
 */
public class BaseTO {

    public function fromJSON(jsonObj:Object):void {
        for (var prop:String in jsonObj) {
            this[prop] = jsonObj[prop];
        }
    }

}
}
