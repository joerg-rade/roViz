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

import spark.components.Button;

public class ObjectTab extends BaseTab {

    protected var form:Form;
    private var confirmBtn:Button;
    private var cancelBtn:Button;

    private var object:ObjectAdapter;
    private var roContextMenu:Menu;

    public function ObjectTab(oa:ObjectAdapter) {
        this.object = oa;
        var title:String = "";
        if (oa.hasOwnProperty("name")) {
            title = oa.name;
        } else if (oa.hasOwnProperty("className")) {
            title = oa.className;
        } else {
            title = "noNameNorClassname";
        }
        label = Utils.deCamel(title);

        setupForm();
        populateForm();
        assembleForm();

        roContextMenu = buildContextMenu();
        addEventListener(MouseEvent.RIGHT_CLICK, contextMenuHandler);
        addEventListener(MenuEvent.MENU_HIDE, hideContextMenu);

        Globals.getInstance().logAdd(title);
    }

    protected function setupForm():void {
        /*        addEventListener(CloseEvent.CLOSE, cancelHandler);
        
                confirmBtn = buildButton("OK", ImageRepository.CheckIcon);
                confirmBtn.addEventListener(MouseEvent.CLICK, okHandler);
                cancelBtn = buildButton("Cancel", ImageRepository.TimesIcon);
                cancelBtn.addEventListener(MouseEvent.CLICK, cancelHandler);       */

        form = new Form();
        form.defaultButton = confirmBtn;
    }

    protected function assembleForm():void {
        var fiBtn:FormItem = new FormItem();
        /*        var btnBar:HGroup = new HGroup();
                btnBar.addElement(confirmBtn);
                btnBar.addElement(cancelBtn);
                fiBtn.addElement(IVisualElement(btnBar));  */
        form.addElement(fiBtn);

        addChild(form);
    }

    protected static function buildFormItem(label:String):FormItem {
        var fi:FormItem = new FormItem();
        fi.direction = "horizontal";
        fi.setStyle("horizontalAlign", "left");
        fi.label = label;
        return fi;
    }

    private static function buildButton(label:String, iconClass:Class):Button {
        var btn:Button = new Button();
        btn.label = label;
        return btn;
    }

    private function populateForm():void {
        for (var prop:String in object) {
            var fi:FormItem = buildFormItem(prop);
            var input:TextInput = new TextInput();
            // TODO see Prompt.populate for ComboBox example, including defaultChoice
            input.text = object[prop];
            fi.addElement(input);
            form.addElement(fi);
        }
        var to:TObject = object.adaptee as TObject;
        var link:Link = to.getLayoutLink();
        var layout:Layout = null;
        while (layout == null) {
            layout = findLayout(link);
        }
        var ui:UIComponent = layout.build();
        addChild(ui);
    }

    private function findLayout(link:Link):Layout {
        var href:String = link.getHref();
        var le:LogEntry = Globals.getInstance().logFind(href);
        if (le == null) {
            link.invoke();
            return null;
        }
        var json:Object = JSON.parse(le.getResponse());
        var layout:Layout = new Layout(json);
        return layout;
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
