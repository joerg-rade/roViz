package org.ro.view.dlg {
import flash.events.MouseEvent;

import mx.containers.FormItem;
import mx.controls.Alert;
import mx.controls.Menu;
import mx.controls.TextInput;
import mx.events.MenuEvent;

import org.ro.core.Utils;
import org.ro.to.TObject;

/**
 * Build a dialog, using form and specification from Object
 */
public class Details extends Dialog {

    private var dObject:TObject;
    private var roContextMenu:Menu;

    public function Details(dObject:TObject) {
        this.dObject = dObject;
        var id:String = dObject.getId();

        super();
        super.title = Utils.deCamel(id);
        roContextMenu = buildContextMenu();
        addEventListener(MouseEvent.RIGHT_CLICK, contextMenuHandler);
        addEventListener(MenuEvent.MENU_HIDE, hideContextMenu);
    }

    override protected function populateForm():void {
        for (var prop:String in dObject) {
            var fi:FormItem = buildFormItem(prop);
            var input:TextInput = new TextInput();
            // TODO see Prompt.populate for ComboBox example, including defsultChoice
            input.text = dObject[prop];
            fi.addElement(input);
            form.addElement(fi);
        }
    }

    public function buildContextMenu():Menu {
        var xml:XML =
                <root>
                    <menuitem id="pin" icon="EyeSlashIcon" label="pin"/>
                </root>;
        var result:Menu = Menu.createMenu(null, xml, false);
        result.labelField = "@label";
        result.iconField = "@icon";
        //m.setStyle("color", "0xC0504D");  text can be colored, but not the menu background
        result.addEventListener(MenuEvent.ITEM_CLICK, itemClickHandler);
        return result;
    }

    public function contextMenuHandler(event:MouseEvent):void {
        event.stopPropagation();
        // TODO seems to take position from underlying tab - eventually adjust by dialog position 
        roContextMenu.show(mouseX, mouseY);
    }

    public function hideContextMenu(event:MouseEvent):void {
        roContextMenu.hide();
    }

    public function itemClickHandler(event:MenuEvent):void {
        var id:String = event.item.@id;
        if (id === "pin") {
            Alert.show("pin clicked");
        } 
    }

}
}
