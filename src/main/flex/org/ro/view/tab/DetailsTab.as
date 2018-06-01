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
import org.ro.layout.Layout;
import org.ro.to.Link;
import org.ro.to.TObject;
import org.ro.xhr.EventLog;
import org.ro.xhr.LogEntry;

import spark.components.Button;

public class DetailsTab extends BaseTab {

    protected var form:Form;
    private var confirmBtn:Button;
    private var cancelBtn:Button;

    private var tObject:TObject;
    private var roContextMenu:Menu;

    public function DetailsTab(tObject:TObject) {
        this.tObject = tObject;
        var title:String = tObject.getId();
        if (tObject.extensions != null) {
            title = tObject.extensions.oid;
        }
        label = Utils.deCamel(title);

        setupForm();
        populateForm();
        assembleForm();

        roContextMenu = buildContextMenu();
        addEventListener(MouseEvent.RIGHT_CLICK, contextMenuHandler);
        addEventListener(MenuEvent.MENU_HIDE, hideContextMenu);
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
        for (var prop:String in tObject) {
            var fi:FormItem = buildFormItem(prop);
            var input:TextInput = new TextInput();
            // TODO see Prompt.populate for ComboBox example, including defaultChoice
            input.text = tObject[prop];
            fi.addElement(input);
            form.addElement(fi);
        }
        var link:Link = tObject.getLayoutLink();
        //FIXME can we assume the object-layout is already in cache?
        if (link != null) {
            var href:String = link.getHref();
            var reg:EventLog = Globals.getInstance().getLog();
            var le:LogEntry = reg.find(href);
            var js:Object = le.retrieveResponse();
            var l:Layout = new Layout(js);
            var ui:UIComponent = l.build();
            addChild(ui);
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
