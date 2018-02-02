package org.ro.to {
public class Parameter extends AbstractTransferObject {
    internal var num:int;
    internal var id:String;
    internal var description:String;
    public var name:String;
    internal var choices:Object;
    internal var choiceList:Vector.<Link>;
    internal var defaultChoice:Object;

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
