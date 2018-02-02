package org.ro.to {
import mx.collections.ArrayCollection;

public class Link extends AbstractTransferObject implements IInvokeable {
    public var title:String;
    public var rel:String;
    public var href:String;
    public var method:String;  //TODO use Method.{GET | PUT | POST | DELETE} ?
    public var type:String;
    public var arguments:Object;
    public var argumentList:Vector.<Argument>;

    public function Link(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    private function init():void {
        argumentList = new Vector.<Argument>();
        for each(var o:Object in this.arguments) {
            argumentList.push(new Argument(o));
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
