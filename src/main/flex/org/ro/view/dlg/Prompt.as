package org.ro.view.dlg {
import flash.events.MouseEvent;

import mx.containers.FormItem;
import mx.controls.ComboBox;
import mx.core.UIComponent;

import org.apache.flex.collections.VectorList;
import org.ro.core.Globals;
import org.ro.core.Utils;
import org.ro.to.Action;
import org.ro.to.Link;
import org.ro.to.Parameter;

import spark.components.TextInput;

/**
 * Build a dialog, using form and specification from Action.parameters
 */
public class Prompt extends Dialog {

    private var action:Action;

    public function Prompt(action:Action) {
        this.action = action;
        var id:String = action.getId();

        super();
        super.title = Utils.deCamel(id);

        Globals.getInstance().logAdd(super.title);
    }

    override protected function populateForm():void {
        var params:Vector.<Parameter> = action.getParameters();
        for each(var p:Parameter in params) {
            var fi:FormItem = buildFormItem(p.getName()); 
            var input:UIComponent;
            if (p.hasChoices()) {
                var cb:ComboBox = new ComboBox();
                cb.dataProvider = new VectorList(p.getChoiceListKeys());
                cb.selectedIndex = p.findIndexOfDefaultChoice();
                if (p.getDefaultChoice() != null) {
                    fi.required = true;
                }
                input = cb;
            } else {
                input = new TextInput();
            }
            fi.addElement(input);
            form.addElement(fi);
        }
    }

    override protected function okHandler(evt:MouseEvent):void {
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

}
}
