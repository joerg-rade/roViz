package org.ro.core {
import mx.collections.ArrayCollection;
import mx.controls.Alert;

import org.ro.layout.Layout;

public class ObjectList {

    private var limit:int;
    private var list:Vector.<ObjectAdapter>;
    private var layout:Layout;

    public function ObjectList(limit:int) {
        this.limit = limit;
        this.list = new Vector.<ObjectAdapter>();
    }

    public function hasLayout():Boolean {
        return layout != null;
    }

    public function isReadyForDisplay():Boolean {
        return (isFilled()); // && areLabelsSet());      

        function isFilled():Boolean {
            return (length() >= limit);
        }

        function areLabelsSet():Boolean {
            return hasLayout() && !layout.arePropertyLabelsToBeSet();
        }
    }

    public function forDataGrid():ArrayCollection {
        var gridList:ArrayCollection = new ArrayCollection();
        for each (var o:ObjectAdapter in list) {
            gridList.addItem(o);
        }
        return gridList;
    }

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
        if (length() < limit) {
            list.push(oa);
        }  else {
            Alert.show("extra element");
        }
    }

}
}
