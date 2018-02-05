package org.ro.to {
public class Parameter extends AbstractTransferObject {
    internal var num:int;
    internal var id:String;
    internal var description:String;
    public var name:String;
    internal var choices:Object;
    internal var choiceList:Vector.<Link>;
    internal var defaultChoice:Object;
    internal var defaultChoiceObject:Link;

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
        defaultChoiceObject = new Link(defaultChoice);
    }

    public function getDefaultChoice():Link {
        return defaultChoiceObject;
    }

    public function hasChoices():Boolean {
        return (choiceList != null) && (choiceList.length > 0);
    }

    public function getChoiceListKeys():Vector.<String> {
        var result:Vector.<String> = new Vector.<String>();
        for each (var l:Link in choiceList) {
            result.push(l.title);
        }
        return result;
    }

    public function getHrefByTitle(title:String):String {
        for each (var l:Link in choiceList) {
            if (l.title == title) return l.href;
        }
        return null;
    }

    public function findIndexOfDefaultChoice():uint {
        var dcTitle:String = defaultChoice.title;
        var title:String;
        for (var i:uint; i < choiceList.length; i++) {
            title = choiceList[i].title;
            if (title == dcTitle) return i;
        }
        return 0;
    }


}
}
