package org.ro.core.model {
import mx.collections.ArrayCollection;

import org.ro.core.Globals;
import org.ro.layout.Layout;
import org.ro.layout.PropertyLayout;
import org.ro.to.Extensions;
import org.ro.to.Link;
import org.ro.to.Property;
import org.ro.to.TObject;

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
        list.push(oa);
    }

    private function isFull():Boolean {
        return length() >= limit;
    }

    public function handleObject(tObj:TObject):void {
        if (!hasLayout()) {
            trace("layout not found, try to invoke");
            tObj.getLayoutLink().invoke();
        }

        // tObj  has links, o doesn't
        tObj.addMembersAsProperties();
        var oa:ObjectAdapter = new ObjectAdapter(tObj);
        if (isFull()) {
            Globals.addObjectTab(oa);
        } else {
            add(oa);
            //TODO FEATURE Open tab immediately and append entries, have title reflect increasing numbers (n/limit)
            if (isFull()) {
                Globals.addListTab(this);
            }
        }
    }

    /** handler chain:
     * (1) FR_OBJECT                TObjectHandler -> invoke()
     * (2) FR_OBJECT_LAYOUT         layoutHandler -> invoke(layout.getProperties()[].getLink()) link can be null?
     * (3) FR_OBJECT_PROPERTY       PropertyHandler -> invoke()
     * (4) FR_PROPERTY_DESCRIPTION  PropertyDescriptionHandler
     */
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
