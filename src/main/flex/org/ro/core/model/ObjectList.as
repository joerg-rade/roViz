package org.ro.core.model {
import mx.collections.ArrayList;

import org.ro.layout.Layout;
import org.ro.layout.PropertyLayout;
import org.ro.to.Extensions;
import org.ro.to.Link;
import org.ro.to.Property;
import org.ro.to.TObject;

public class ObjectList {

    private var limit:uint;
    private var list:Vector.<ObjectAdapter>;
    private var layout:Layout;

    public function ObjectList() {
        this.list = new Vector.<ObjectAdapter>();
    }

    public function initSize(limit:uint):void {
        this.limit = limit;
    }

    public function hasLayout():Boolean {
        return layout != null;
    }

    public function asArrayList():ArrayList {
        var al:ArrayList = new ArrayList();
        for each (var o:ObjectAdapter in list) {
            al.addItem(o);
        }
        return al;
    }

    //TODO can/should layout be encapsulated more?
    public function setLayout(layout:Layout):void {
        this.layout = layout;
        initPropertyDescription();
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

    //TODO public for test only, reduce visibility to internal
    public function add(oa:ObjectAdapter):void {
        if (oa.adaptee is TObject) {
            var tObj:TObject = oa.adaptee as TObject;
            tObj.addMembersAsProperties();
        }
        list.push(oa);
    }

    public function isFull():Boolean {
        return length() >= limit;
    }

    private function initPropertyDescription():void {
        if (layout.arePropertyLabelsToBeSet()) {
            var pls:Vector.<PropertyLayout> = layout.getProperties();
            var l:Link;
            for each(var pl:PropertyLayout in pls) {
                l = pl.getLink();
                l.invoke();
            }
        }
    }

    public function handleProperty(p:Property):void {
        var e:Extensions = p.getExtension();
        var friendlyName:String = e.getFriendlyName();
        if (layout == null) {
            //TODO should not happen ...
            layout = new Layout();
        }
        layout.addPropertyLabel(p.getId(), friendlyName);
    }

}
}
