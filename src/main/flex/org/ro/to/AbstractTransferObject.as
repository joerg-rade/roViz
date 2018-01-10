package org.ro.to {
import org.ro.xhr.XmlHttpRequest;

/**
 *  Common 'abstract' superclass of Transfer Objects.
 *  Constructor should not be called.
 */
internal class AbstractTransferObject {

    public function fromObject(obj:Object):void {
        for (var prop:String in obj) {
            this[prop] = obj[prop];
        }
    }

    public function invoke():void {
        var xhr:XmlHttpRequest = new XmlHttpRequest();
        xhr.invoke(this as IInvokeable);
    }

}
}
