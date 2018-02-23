package org.ro.to {
import org.ro.xhr.XmlHttpRequest;

public class Invokeable extends LinkedTO {
    public static const GET:String = "GET";
    public static const PUT:String = "PUT";
    public static const POST:String = "POST";
    public static const DELETE:String = "DELETE";

    internal var href:String;
    internal var method:String;
//    internal var arguments:Object;

    public function invoke():void {
        var xhr:XmlHttpRequest = new XmlHttpRequest();
        xhr.invoke(this);
    }

    public function getHref():String {
        return href;
    }

    public function setHref(href:String):void {
        this.href = href;
    }

    public function getMethod():String {
        return method;
    }

    public function setMethod(method:String):void {
        this.method = method;
    }

//    public function getArguments():Object {
//        return arguments;
//    }
}
}
