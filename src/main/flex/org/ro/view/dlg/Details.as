package org.ro.view.dlg {
import mx.containers.FormItem;
import mx.core.UIComponent;

import org.ro.core.Utils;
import org.ro.to.TObject;

import spark.components.TextInput;

/**
 * Build a dialog, using form and specification from Object
 * TODO: refactor together with Prompt
 */
public class Details extends Dialog {

    private var dObject:TObject;

    public function Details(dObject:TObject) {
        this.dObject = dObject;
        this.title = Utils.deCamel(dObject.getId());

        super();
    }

    override protected function populateForm():void {
        for (var prop:String in dObject) {
            var fi:FormItem = buildFormItem(prop);
            var input:UIComponent = new TextInput();
            /*            if (p.hasChoices()) {
                            var cb:ComboBox = new ComboBox();
                            cb.dataProvider = new VectorList(p.getChoiceListKeys());
                            cb.selectedIndex = p.findIndexOfDefaultChoice();
                            if (p.getDefaultChoice() != null) {
                                fi.required = true;
                            }
                            input = cb;
                        }*/
            input = new TextInput();
            fi.addElement(input);
            form.addElement(fi);
        }
    }

}
}
