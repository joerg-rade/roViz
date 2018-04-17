package org.ro.to {

public class List extends LinkedTO {
    internal var resulttype:String;
    internal var result:Object;
    internal var resultObject:Result;

    public function List(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromJSON(jsonObj);
            init();
        }
    }

    override protected function init():void {
        super.init();
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
