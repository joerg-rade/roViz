package org.ro.core {

import mx.collections.ArrayCollection;

import org.ro.layout.Layout;
import org.ro.to.Invokeable;
import org.ro.to.Member;

public class ObjectList {

    private var limit:int;
    private var list:Vector.<Object>;  //TODO use Vector.<DomainObject>
    private var layout:Layout;


    public function ObjectList(limit:int) {
        this.limit = limit;
        this.list = new Vector.<Object>();
    }

    public function addObject(members:Vector.<Invokeable>):void {
        var object:Object = {};
        for each(var m:Member in members) {
            object[m.getId()] = m.getValue();
        }
        if (list.length <= limit) {
            list.push(object);
        } else {
            //TODO throw an exception
        }
    }

    public function hasLayout():Boolean {
        return layout != null;
    }

    public function isReadyForDisplay():Boolean {
        return (isFilled() );          //&& areLabelsSet()

        function isFilled():Boolean {
            return (list.length >= limit);
        }
        function areLabelsSet():Boolean {
            return hasLayout() && !layout.arePropertyLabelsToBeSet();
        }
    }

    public function forDataGrid():ArrayCollection {
        var gridList:ArrayCollection = new ArrayCollection();
        for each (var o:Object in list) {
            gridList.addItem(o);
        }
        return (gridList);
    }

    public function setLayout(layout:Layout):void {
        this.layout = layout;
    }

    public function getLayout():Layout {
        return layout;
    }

    public function last():Object {
        return list[list.length - 1];
    }

    public function length():Object {
        return list.length;
    }

}
}
