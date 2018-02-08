package org.ro.to {
import mx.collections.ArrayCollection;

public class Member extends AbstractTransferObject implements IInvokeable {
    public static const ACTION:String = "action";
    public static const PROPERTY:String = "property";

    public var id:String;
    internal var memberType:String;
    internal var links:Array;
    public var linkList:Vector.<Link>;
    public var value:Object;
    internal var format:Object;
    internal var extensions:Object;
    internal var disabledReason:String;
    internal var href:String;
    internal var method:String;

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

    public static function parse(objArray:Object):Vector.<IInvokeable> {
        var memberList:Vector.<IInvokeable> = new Vector.<IInvokeable>();
        for each (var v:Object in objArray) {
            memberList.push(new Member(v));
        }
        return memberList;
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

    public function getArguments():Object {
        //members do not have arguments - return nothing.
        return null;
    }

    public static function filterProperties(members:Vector.<IInvokeable>):Vector.<IInvokeable>{
        var result:Vector.<IInvokeable>= new Vector.<IInvokeable>();
        for each(var m:Member in members) {
            if (m.memberType == PROPERTY) {
                result.push(m);
            }
        }
        return result;
    }

}
}
