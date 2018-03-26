package org.ro.core {
import mx.controls.LinkButton;

import org.ro.mx.ImageRepository;

/**
 * Wrapps the adapted object and adds an operation that renders the adaptee as a clickable link in the UI.
 * @see: https://en.wikipedia.org/wiki/Adapter_pattern
 */
dynamic public class ObjectAdapter {
    private const defaultIcon:Class = ImageRepository.ObjectIcon;
    private const defaultTitle:String = "title not set";
    private const defaultType:String = "String";

    private var _adaptee:Object;
    private var _type:String;
    private var _icon:Class;

    private var _title:String;

    public function ObjectAdapter(adaptee:Object,
                                  title:String = null,
                                  type:String = null,
                                  icon:Class = null) {
        _adaptee = adaptee;
        initPropertyAccessors();
        _title = title;
        _type = type;  //default to String?
        _icon = icon;
        if (_type == null) {
            _title = defaultType;
        }
        if (_icon == null) {
            _icon = defaultIcon;
        }
        if (_title == null) {
            _title = defaultTitle;
        }
    }

    public function asLink():LinkButton {
        var btn:LinkButton = new LinkButton();
        btn.width = 16;
        btn.height = 16;
        btn.enabled = false;
        btn.setStyle("icon", _icon);
        btn.label = _title;
        btn.setStyle("textDecoration", "underline");
        return btn;
    }

    public function getProperty(name:String):* {
        return _adaptee[name];
    }

    public function toString():String {
        return "[" + _title + " -> " + _type + "]";
    }

    // add properties of the adaptee to the adapter dynamically
    // https://en.wikipedia.org/wiki/Clarke%27s_three_laws#3
    private function initPropertyAccessors():void {
        for (var prop:String in _adaptee) {
            var p:Object = _adaptee[prop];
            if (p != null && p.toString() == "[object Object]") {
                p = this.asLink();
            }
            this[prop] = p;
        }
    }

}
}
