package org.ro.core {
import mx.collections.ArrayCollection;

import org.ro.layout.Layout;
import org.ro.to.Invokeable;
import org.ro.to.Member;

public class ObjectList {

    private var limit:int;
    private var list:Vector.<ObjectAdapter>;
    private var layout:Layout;

    public function ObjectList(limit:int) {
        this.limit = limit;
        this.list = new Vector.<ObjectAdapter>();
    }

    /**
     * @param properties contains the attributes of the object
     */
    public function addObject(properties:Vector.<Invokeable>):void {
        var object:Object = new Object();
        var key:String;
        var value:Object;
        var type:Class;
        var attribute:Object;
        var wrapper:ObjectAdapter;
        for each(var p:Member in properties) {
            key = p.getId();
            value = p.getValue();
            type = p.getType();
            //TODO apply typing here ?
            attribute = new type(value);
            // or is an empty Object more appropriate?
            if (value == null) attribute = null;
            object[key] = attribute;
        }
        wrapper = new ObjectAdapter(object, null, null, null);
        list.push(wrapper);
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
        return list[list.length - 1];
    }

    public function length():uint {
        return list.length;
    }

}
}
