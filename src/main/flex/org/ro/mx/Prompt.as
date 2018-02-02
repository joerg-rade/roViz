package org.ro.mx {
import flash.events.Event;
import flash.events.MouseEvent;

import mx.containers.Form;
import mx.containers.FormItem;
import mx.containers.TitleWindow;
import mx.core.IVisualElement;
import mx.events.CloseEvent;
import mx.managers.PopUpManager;

import org.ro.core.Globals;
import org.ro.to.Action;
import org.ro.to.Link;
import org.ro.to.Parameter;

import spark.components.Button;
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

        //TODO iterate over paramters
        var params:Vector.<Parameter> = action.parameterList;
        for each(var p:Parameter in params) {
            var fi:FormItem = new FormItem();
            fi.label = p.name;
            var ti:TextInput = new TextInput();
            fi.addElement(ti);
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
        var args:Object = l.argumentList;
        // for each(var )
        //TODO iterate over TextInputs and set values into matching (id,num) args
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

    private function getInputs():void {
    }

}
}
