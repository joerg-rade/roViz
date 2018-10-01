package org.ro.view.tab {
import flash.events.MouseEvent;

import mx.containers.Form;
import mx.containers.FormItem;
import mx.controls.Alert;
import mx.controls.Menu;
import mx.controls.TextInput;
import mx.core.UIComponent;
import mx.events.MenuEvent;

import org.ro.core.Utils;
import org.ro.core.event.EventLog;
import org.ro.core.model.ObjectAdapter;
import org.ro.layout.Layout;
import org.ro.to.Link;
import org.ro.to.TObject;
import org.ro.view.UIUtil;

import spark.components.Button;

public class ObjectTab extends BaseTab {
    private var log:EventLog = EventLog.getInstance();

    protected var form:Form;
    private var confirmBtn:Button;
    private var cancelBtn:Button;

    private var object:ObjectAdapter;
    private var roContextMenu:Menu;

    public function ObjectTab(oa:ObjectAdapter) {
        this.object = oa;
        label = oa.tag();

        setupForm();
        populateForm();
        assembleForm();

        roContextMenu = buildContextMenu();
        addEventListener(MouseEvent.RIGHT_CLICK, contextMenuHandler);
        addEventListener(MenuEvent.MENU_HIDE, hideContextMenu);
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
        //FIXME refactor: ObjectObserver reponsibility
        var t:TObject = object.adaptee as TObject;
        var link:Link = t.getLayoutLink();
        var href:String = link.getHref();
        var layout:Layout = log.find(href).object as Layout;
        if (layout == null) {
            //TODO happens with FixtureResult object
            trace("layout is null");
        } else {
            var ui:UIComponent = layout.build();
            addChild(ui);
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