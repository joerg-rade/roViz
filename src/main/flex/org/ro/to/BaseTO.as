package org.ro.to {
/**
 *  Common 'abstract' superclass of Transfer Objects.
 *  No Constructor.
 */
public class BaseTO {

    public function fromObject(obj:Object):void {
        for (var prop:String in obj) {
            this[prop] = obj[prop];
        }
    }

}
}
