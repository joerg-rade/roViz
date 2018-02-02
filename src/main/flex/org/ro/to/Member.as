package org.ro.to {
import mx.collections.ArrayCollection;

public class Member extends AbstractTransferObject implements IInvokeable {
    public static const ACTION:String = "action";
    public static const PROPERTY:String = "property";

    public var id:String;
    public var memberType:String;
    internal var links:Array;
    public var linkList:Vector.<Link>; //TODO convert links during init()?
    public var value:Object;
    public var format:Object;
    public var extensions:Object;
    public var disabledReason:String;
    public var href:String;
    public var method:String;

    public function Member(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
        
        function init():void {
            linkList = new Vector.<Link>();
            var l:Link;
            for each (var o:Object in links) {
                l = new Link(o);
                linkList.push(l);
            }
            var link:Link = linkList[0];
            href = link.getHref();
            method = link.getMethod();
        }
    }

    public static function parse(objArray:Object):ArrayCollection {
        var members:Array = [];
        for each (var v:Object in objArray) {
            members.push(new Member(v));
        }
        return new ArrayCollection(members);
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
