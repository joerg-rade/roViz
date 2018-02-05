package org.ro.mx {
import flash.events.Event;
import flash.events.MouseEvent;

import mx.containers.Form;
import mx.containers.FormItem;
import mx.containers.TitleWindow;
import mx.controls.ComboBox;
import mx.core.IVisualElement;
import mx.core.UIComponent;
import mx.events.CloseEvent;
import mx.managers.PopUpManager;

import org.apache.flex.collections.VectorList;
import org.ro.core.Globals;
import org.ro.to.Action;
import org.ro.to.Link;
import org.ro.to.Parameter;

import spark.components.Button;
import spark.components.DropDownList;
import spark.components.HGroup;
import spark.components.TextInput;

/**
 * Build a dialog, using form and specification from Action.parameters
 */
public class Prompt extends TitleWindow {

    private var action:Action;
    private var form:Form;

    public function Prompt(action:Action) {
        this.action = action;
        this.title = action.id;
        this.showCloseButton = true;
        addEventListener(CloseEvent.CLOSE, closeHandler);

        var confirmBtn:Button = buildButton("OK", ImageRepository.CheckIcon);
        confirmBtn.addEventListener(MouseEvent.CLICK, invokeHandler);
        var cancelBtn:Button = buildButton("Cancel", ImageRepository.TimesIcon);
        cancelBtn.addEventListener(MouseEvent.CLICK, closeHandler);

        form = new Form();
        form.defaultButton = confirmBtn;

        var params:Vector.<Parameter> = action.parameterList;
        for each(var p:Parameter in params) {
            var fi:FormItem = new FormItem();
            fi.label = p.name;
            var input:UIComponent;
            if (p.hasChoices()) {
                var cb:ComboBox = new ComboBox();
                cb.dataProvider = new VectorList(p.getChoiceListKeys());
                cb.selectedIndex = p.findIndexOfDefaultChoice();
                input = cb;
            } else {
                input = new TextInput();
            }
            fi.addElement(input);
            form.addElement(fi);
        }

        var fiBtn:FormItem = new FormItem();
        var btnBar:HGroup = new HGroup();
        btnBar.addElement(confirmBtn);
        btnBar.addElement(cancelBtn);
        fiBtn.addElement(IVisualElement(btnBar));
        form.addElement(fiBtn);

        addChild(form);

        PopUpManager.addPopUp(this, Globals.getView(), true);
        PopUpManager.centerPopUp(this);
    }

    private function closeHandler(evt:Event):void {
        close();
    }

    private function invokeHandler(evt:MouseEvent):void {
        var l:Link = this.action.getInvokeLink();
        //iterate over FormItems (0,1, but not 2 (buttons)
        var fi:FormItem;
        var key:String;
        var input:UIComponent;
        var val:String;
        for (var i:int; i < form.numElements; i++) {
            fi = form.getElementAt(i) as FormItem;
            key = fi.label;
            input = fi.getElementAt(0) as UIComponent;
            if (input is TextInput) {
                var ti:TextInput = input as TextInput;
                val = ti.text;
                l.setArgument(key, val)
            } else if (input is ComboBox) {
                var ddl:ComboBox = input as ComboBox;
                var selection:String = ddl.selectedLabel;
                var p:Parameter = this.action.findParameterByName(key.toLowerCase());
                var href:String = p.getHrefByTitle(selection);
                l.setArgument(key, href)
            }
        }
        l.invoke();
        close();
    }

    private function close():void {
        PopUpManager.removePopUp(this);
    }

    private function buildButton(label:String, iconClass:Class):Button {
        var btn:Button = new Button();
        btn.label = label;
        return btn;
    }

}
}
