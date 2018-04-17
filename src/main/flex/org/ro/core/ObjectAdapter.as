package org.ro.core {
import mx.controls.LinkButton;

import org.ro.mx.ImageRepository;
import org.ro.view.table.ObjectIconRenderer;

/**
 * Wrapps the adapted object and adds an operation that renders the adaptee as a clickable link in the UI.
 * @see: https://en.wikipedia.org/wiki/Adapter_pattern
 */
dynamic public class ObjectAdapter {
    private const defaultIcon:Class = ImageRepository.ObjectIcon;
    private const defaultLabel:String = "label not set";
    private const defaultType:String = "String";

    private var _adaptee:Adaptable;
    private var _type:String;
    private var _icon:Class;

    private var _label:String;

    public function ObjectAdapter(adaptee:Adaptable,
                                  label:String = null,
                                  type:String = null,
                                  icon:Class = null) {
        _adaptee = adaptee;
        initPropertyAccessors();
        _label = label;
        _type = type;  //default to String?
        _icon = icon;
        if (_type == null) {
            _type = defaultType;
        }
        if (_icon == null) {
            _icon = defaultIcon;
        }
        if (_label == null) {
            _label = defaultLabel;
        }
    }

    public function asLink():LinkButton {
        var btn:LinkButton = new LinkButton();
        btn.width = 16;
        btn.height = 16;
        return btn;
    }

    public function getProperty(name:String):* {
        return _adaptee[name];
    }

    public function fromObject(obj:Object):void {
        for (var prop:String in obj) {
            this[prop] = obj[prop];
        }
    }

    public function toString():String {
        return "[" + _label + " -> " + _type + "]";
    }

    // add properties of the adaptee to the adapter dynamically
    // https://en.wikipedia.org/wiki/Clarke%27s_three_laws #3
    private function initPropertyAccessors():void {
        for (var prop:String in _adaptee) {
            var p:Object = _adaptee[prop];
            if (p != null && p.toString() == "[object Object]") {
                p = new ObjectIconRenderer().data = p;
            }
            this[prop] = p;
        }
    }

    public function get icon():Class {
        return _icon;
    }

    public function get label():String {
        return _label;
    }

}
}
