package org.ro.view.dlg {
import flash.events.Event;
import flash.events.MouseEvent;

import mx.containers.Form;
import mx.containers.FormItem;
import mx.containers.TitleWindow;
import mx.controls.Alert;
import mx.core.IVisualElement;
import mx.events.CloseEvent;
import mx.managers.PopUpManager;

import org.ro.core.Globals;
import org.ro.view.ImageRepository;
import org.ro.view.UIUtil;

import spark.components.Button;
import spark.components.HGroup;

/**
 * Build a dialog using form.
 *
 * 'abstract' superclass
 */
public class Dialog extends TitleWindow {

    protected var form:Form;
    private var confirmBtn:Button;
    private var cancelBtn:Button;

    public function Dialog() {
        setupForm();
        populateForm();
        assembleForm();
    }

    protected function setupForm():void {
        this.showCloseButton = true;
        addEventListener(CloseEvent.CLOSE, cancelHandler);

        confirmBtn = UIUtil.buildButton("OK", ImageRepository.CheckIcon);
        confirmBtn.addEventListener(MouseEvent.CLICK, okHandler);
        cancelBtn = UIUtil.buildButton("Cancel", ImageRepository.TimesIcon);
        cancelBtn.addEventListener(MouseEvent.CLICK, cancelHandler);

        form = new Form();
        form.defaultButton = confirmBtn;
    }

    protected function populateForm():void {
    }

    protected function assembleForm():void {
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

    private function cancelHandler(evt:Event):void {
        close();
    }

    protected function okHandler(evt:MouseEvent):void {
        Alert.show("OK pressed - no action defined");
    }

    protected function close():void {
        PopUpManager.removePopUp(this);
    }

}
}
