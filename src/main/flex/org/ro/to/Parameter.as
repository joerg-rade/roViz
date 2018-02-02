package org.ro.to {
public class Parameter extends AbstractTransferObject {
    public var num:int;
    public var id:String;
    public var description:String;
    public var name:String;
    public var choices:Object;
    public var choiceList:Vector.<Link>;
    public var defaultChoice:Object;

    public function Parameter(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    private function init():void {
        choiceList = new Vector.<Link>();
        for each(var o:Object in this.choices) {
            choiceList.push(new Link(o));
        }
    }
}
}
