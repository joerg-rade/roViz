package org.ro.core.model {
import mx.collections.ArrayCollection;

import org.ro.layout.Layout;

public class ObjectList {

    private var limit:int;
    private var list:Vector.<ObjectAdapter>;
    private var layout:Layout;

    public function ObjectList() {
        this.list = new Vector.<ObjectAdapter>();
    }

    public function initSize(limit:int):void {
        this.limit = limit;
    }

    public function hasLayout():Boolean {
        return layout != null;
    }

    public function asArrayCollection():ArrayCollection {
        var ac:ArrayCollection = new ArrayCollection();
        for each (var o:ObjectAdapter in list) {
            ac.addItem(o);
        }
        return ac;
    }

    //TODO can/should layout be capsulated more?
    public function setLayout(layout:Layout):void {
        this.layout = layout;
    }

    public function getLayout():Layout {
        return layout;
    }

    public function last():ObjectAdapter {
        return list[length() - 1];
    }

    public function length():uint {
        return list.length;
    }

    public function add(oa:ObjectAdapter):void {
        list.push(oa);
    }

    public function isFull():Boolean {
        return length() >= limit;
    }
}
}
