package org.ro.core {
import mx.collections.ArrayCollection;

import org.ro.layout.Layout;
import org.ro.to.Invokeable;
import org.ro.to.Link;
import org.ro.to.Member;
import org.ro.to.TObject;

public class ObjectList {

    private var limit:int;
    private var list:Vector.<ObjectAdapter>;
    private var layout:Layout;

    public function ObjectList(limit:int) {
        this.limit = limit;
        this.list = new Vector.<ObjectAdapter>();
    }

    /**
     * @param members (attributes and functions) of the object
     */
    public function addObject(members:Vector.<Invokeable>):void {
        var o:TObject = new TObject();
        for each(var m:Member in members) {
            if (m.getMemberType() == Member.PROPERTY) {
                addAsProperty(o, m);
            }
        }
        var wrapper:ObjectAdapter = new ObjectAdapter(o);
        list.push(wrapper);
    }

    private function addAsProperty(dynObj:TObject, property:Member):void {
        var attribute:Object = null;
        var value:Object = property.getValue();
        if (value != null) {
            var typeSpec:Class = property.getType();
            attribute = new typeSpec(value);
        }
        // if value={} (ie. of class Object), 
        // it is represented as [object Object] 
        if (value == "[object Object]") {
            var link:Link = new Link(value);
            attribute = new ObjectAdapter(link, link.getTitle(), "Link");
        }
        var key:String = property.getId();
        dynObj[key] = attribute;
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
