package org.ro.core {

import mx.collections.ArrayCollection;

import org.ro.layout.Layout;
import org.ro.to.IInvokeable;
import org.ro.to.Member;

public class ObjectList {

    private var limit:int;
    private var list:Vector.<Object>;  //TODO use Vector.<DomainObject>
    private var layout:Layout;


    public function ObjectList(limit:int) {
        this.limit = limit;
        this.list = new Vector.<Object>();
    }

    public function addObject(members:Vector.<IInvokeable>):void {
        var object:Object = {};
        for each(var m:Member in members) {
            object[m.id] = m.value;
        }
        if (list.length <= limit) {
            list.push(object);
        } else {
            //TODO throw an execpetion
        }
    }

    public function isFilled():Boolean {
        return (list.length >= limit);
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

    public function last():Object {
        return list[list.length - 1];
    }

    public function length():Object {
        return list.length;
    }
}
}