package org.ro.view.tab {
import flash.events.MouseEvent;

import mx.containers.Form;
import mx.containers.FormItem;
import mx.controls.Alert;
import mx.controls.Menu;
import mx.controls.TextInput;
import mx.core.UIComponent;
import mx.events.MenuEvent;

import org.ro.core.Globals;
import org.ro.core.Utils;
import org.ro.core.event.LogEntry;
import org.ro.core.model.ObjectAdapter;
import org.ro.layout.Layout;
import org.ro.to.Link;
import org.ro.to.TObject;
import org.ro.view.UIUtil;

import spark.components.Button;

public class ObjectTab extends BaseTab {

    protected var form:Form;
    private var confirmBtn:Button;
    private var cancelBtn:Button;

    private var object:ObjectAdapter;
    private var roContextMenu:Menu;

    public function ObjectTab(oa:ObjectAdapter) {
        this.object = oa;
        var title:String = buildTitle();
        label = Utils.deCamel(title);

        setupForm();
        populateForm();
        assembleForm();

        roContextMenu = buildContextMenu();
        addEventListener(MouseEvent.RIGHT_CLICK, contextMenuHandler);
        addEventListener(MenuEvent.MENU_HIDE, hideContextMenu);

        Globals.logAdd(title);
    }
    
    private function buildTitle():String {
        var title:String = "";
        if (oa.hasOwnProperty("name")) {
            title = oa.name;
        } else if (oa.hasOwnProperty("className")) {
            title = oa.className;
        } else {
            title = "noNameNorClassname";
        }
        return title;
    }

    protected function setupForm():void {
        form = new Form();
        form.defaultButton = confirmBtn;
    }

    protected function assembleForm():void {
        var fiBtn:FormItem = new FormItem();
        form.addElement(fiBtn);
        addChild(form);
    }

    private function populateForm():void {
        for (var p:String in object) {
            var fi:FormItem = UIUtil.buildFormItem(p);
            var input:TextInput = new TextInput();
            // TODO see Prompt.populate for ComboBox example, including defaultChoice
            input.text = object[p];
            fi.addElement(input);
            form.addElement(fi);
        }
        var t:TObject = object.adaptee as TObject;
        var layout:Layout = findLayout(t);
        if (layout == null) {
            //TODO happens with FixtureResult object
            trace("layout is null");
        } else {
            var ui:UIComponent = layout.build();
            addChild(ui);
        }
    }

    private function findLayout(tObject:TObject):Layout {
        var link:Link = tObject.getLayoutLink();
        var href:String = link.getHref();
        //TODO replace by an event based solution
        var layout:Layout;
        const start:uint = new Date().time;
        var stop:uint = new Date().time;
        //loop for 3 seconds
        while (layout == null && (stop - start < 3000)) {
            layout = findLayout(href);
            stop = new Date().time;
        }
        return layout;

        function findLayout(href:String):Layout {
            var l:Layout;
            var le:LogEntry = Globals.logFind(href);
            if (le == null) {
                link.invoke();
            } else if (le.getResponse() == null) {
                // do nothing, return null
            } else {
                var json:Object = JSON.parse(le.getResponse());
                l = new Layout(json);
            }
            return l;
        }
    }

    public function contextMenuHandler(event:MouseEvent):void {
        event.stopPropagation();
        // TODO seems to take position from underlying tab - eventually adjust by dialog position 
        roContextMenu.show(mouseX, mouseY);
    }

    public function hideContextMenu(event:MouseEvent):void {
        roContextMenu.hide();
    }

    public static function buildContextMenu():Menu {
        var xml:XML =
                <root>
                    <menuitem id="pin" icon="EyeSlashIcon" label="pin"/>
                </root>;
        var result:Menu = Menu.createMenu(null, xml, false);
        result.labelField = "@label";
        result.iconField = "@icon";
        result.addEventListener(MenuEvent.ITEM_CLICK, itemClickHandler);
        return result;
    }

    public static function itemClickHandler(event:MenuEvent):void {
        var id:String = event.item.@id;
        if (id === "pin") {
            Alert.show("pin clicked");
        }
    }

}
}