package org.ro.to {

public class List1_16_2 extends LinkedTO {
    internal var resulttype:String;
    internal var result:Object;
    private var resultObject:Result;
    internal var memberType:String;
    internal var disabledReason:String;
    internal var extensions:Object;
    internal var value:Object;
    internal var id:String;

    public function List1_16_2(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromJSON(jsonObj);
            init();
        }
    }

    override protected function init():void {
        super.init();
        resultObject = new Result(result);

        var valueList:Vector.<org.ro.to.Link> = new Vector.<Link>();
        for each (var o:Object in links) {
            valueList.push(new Link(o));
        }
    }

    public function getValues():Vector.<Link> {
        return linkList;
    }

    public function getResult():Result {
        return this.resultObject;
    }

    public function getLinkList():Vector.<Link> {
        return this.linkList;
    }

}
}
