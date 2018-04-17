package org.ro.to {
//TODO Design Issue: Does Result qualify as class?
public class Result extends LinkedTO {
    internal var value:Array;
    internal var valueList:Vector.<Invokeable>;
    internal var extensions:Object;
    internal var extensionsObject:Extensions;

    public function Result(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromJSON(jsonObj);
            init();
        }
    }

    override protected function init():void {
        valueList = new Vector.<Invokeable>();
        for each(var v:Object in this.value) {
            valueList.push(new Link(v));
        }
        extensionsObject = new Extensions(extensions);
    }

    public function getValues():Vector.<Invokeable> {
        return this.valueList;
    }

}
}
