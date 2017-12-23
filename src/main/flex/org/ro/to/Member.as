package org.ro.to {
import mx.collections.ArrayCollection;

public class Member extends AbstractTransferObject implements IInvokeable {
    public static const ACTION:String = "action";
    public static const PROPERTY:String = "property";

    public var id:String;
    public var memberType:String;  //TODO use enumeration 
    public var links:Array;
    public var href:String;
    public var method:String;       //TODO use enumeration e.g. Method.GET

    public function Member(jsonObj:Object=null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            this.init();
        }
    }

    public static function parse(objArray:Object):ArrayCollection {
        var members:Array = [];
        for each (var v:Object in objArray) {
            members.push(new Member(v));
        }
        return new ArrayCollection(members);
    }

    private function init():void {
        var link:Link = new Link(links[0]);
        href = link.getHref();
        method = link.getMethod();
    }

    public function getServiceName():String {
        var a1:Array = href.split("/");
        var a2:Array = a1[5].split(".");
        return a2[a2.length - 1];
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
