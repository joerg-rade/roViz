package org.ro.to {
public class Result extends AbstractTransferObject {
    internal var value:Array;
    internal var valueList:Vector.<IInvokeable>;
    internal var links:Array;
    internal var linkList:Vector.<Link>;
    internal var extensions:Object;
    internal var extensionsObject:Extensions;

    public function Result(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    private function init():void {
        valueList = new Vector.<IInvokeable>();
        for each(var v:Object in this.value) {
            valueList.push(new Link(v));
        }
        linkList = new Vector.<Link>();
        for each(var l:Object in this.links) {
            linkList.push(new Link(l));
        }
        extensionsObject = new Extensions(extensions);
    }

    public function getValues():Vector.<IInvokeable> {
        return this.valueList;
    }

    public function getLinks():Vector.<Link> {
        return this.linkList;
    }

}
}
