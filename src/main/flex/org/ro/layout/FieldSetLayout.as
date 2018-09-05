package org.ro.layout {
import mx.containers.Form;
import mx.containers.FormItem;
import mx.containers.HBox;

import org.ro.to.Property;
import org.ro.view.UIUtil;

public class FieldSetLayout extends AbstractLayout {

    internal var name:String;
    internal var action:Object;  // this is a list of actions
    internal var property:Object; // this is a list of properties
    internal var metadataError:String;
    internal var id:String;
    internal var unreferencedActions:Object;
    internal var unreferencedCollections:Object;

    public function FieldSetLayout(jsonObj:Object = null) {
        fromObject(jsonObj);
    }

    public function build():HBox {
        var result:HBox = new HBox();
        UIUtil.decorate(result, "FieldSetLayout", debugInfo);
        var fi:FormItem;
        var form:Form = new Form();
        for each(var p:Property in property) {
            fi = UIUtil.buildFormItem(p.toString());
            form.addElement(fi);
        }
        result.addChild(form);
        return result;
    }

}
}
