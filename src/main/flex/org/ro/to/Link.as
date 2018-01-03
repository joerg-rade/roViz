package org.ro.to {
import mx.collections.ArrayCollection;

public class Link extends AbstractTransferObject implements IInvokeable{
    public var title:String;
    public var rel:String;
    public var href:String;
    public var method:String;  //TODO enumeration?
    public var type:String;
    public var arguments:Object;

    public function Link(jsonObj:Object=null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
        }
    }

    public static function parse(objArray:Object):ArrayCollection {
        var links:Array = [];
        for each (var v:Object in objArray) {
            links.push(new Link(v));
        }
        return new ArrayCollection(links);
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

}
}
