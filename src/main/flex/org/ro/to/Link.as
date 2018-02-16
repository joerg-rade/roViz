package org.ro.to {
public class Link extends AbstractTransferObject implements IInvokeable {
    internal var title:String;
    internal var rel:String;
    internal var href:String;
    internal var method:String;
    internal var type:String;
    internal var args:Object; // http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/listAll/invoke
    internal var arguments:Object;
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

    public function getArguments():Object {
        return this.arguments;
    }

    public function setArgument(key:String, value:String):void {
        var k:String = key.toLowerCase();
        if (k == "script") {
            var href:Object = {"href": value};
            this.arguments[k].value = href;
        } else {
            this.arguments[k].value = value;
        }
    }

}
}
