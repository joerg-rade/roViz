package org.ro.to {
import org.ro.xhr.XmlHttpRequest;

/**
 *  Common 'abstract' superclass of Transfer Objects.
 *  Constructor should not be called.
 */
public class AbstractTransferObject {
    // eventually put into common superclass of Link and Member
    public static const GET:String = "GET";
    public static const PUT:String = "PUT";
    public static const POST:String = "POST";
    public static const DELETE:String = "DELETE";

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
