package org.ro.to {
import org.ro.mx.XmlHttpRequest;

//TODO class pretends to be abstract ...
internal class AbstractTransferObject {
    public function fromObject(obj:Object):void {
        for (var prop:String in obj) {
            this[prop] = obj[prop];
        }
    }

    //TODO move into commo Superclass of Link, Member, etc
    public function invoke():void {
        var xhr:XmlHttpRequest = new XmlHttpRequest();
        xhr.invoke(this as IInvokeable);
    }

}
}
