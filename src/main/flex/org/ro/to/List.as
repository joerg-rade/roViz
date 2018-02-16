package org.ro.to {

public class List extends AbstractTransferObject {
    internal var links:Object;
    internal var linkList:Vector.<Link>;
    internal var resulttype:String;
    internal var result:Object;
    internal var resultObject:Result;

    public function List(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    private function init():void {
        linkList = new Vector.<Link>();
        for each(var l:Object in this.links) {
            linkList.push(new Link(l));
        }
        resultObject = new Result(result);
    }
    
    public function getResult():Result {
        return this.resultObject;
    }

    public function getLinkList():Vector.<Link> {
        return this.linkList;
    }

}
}
