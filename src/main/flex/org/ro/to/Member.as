package org.ro.to {
import mx.collections.ArrayCollection;

public class Member extends AbstractTransferObject implements IInvokeable {
    public static const ACTION:String = "action";
    public static const PROPERTY:String = "property";

    public var id:String;
    public var memberType:String;
    public var links:Array;
    public var value:Object;
    public var format:Object;
    public var extensions:Object;
    public var disabledReason:String;
    public var href:String;
    public var method:String;

    public function Member(jsonObj:Object = null) {
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

    public static function filterProperties(members:ArrayCollection):ArrayCollection {
        var result:Array = [];
        for each(var m:Member in members) {
            if (m.memberType == PROPERTY) {
                result.push(m);
            }
        }
        return new ArrayCollection(result);
    }
}
}
