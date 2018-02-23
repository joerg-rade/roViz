package org.ro.layout {
import flash.display.DisplayObject;

import mx.containers.HBox;

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

    public function build():DisplayObject {
        var result:HBox = new HBox();
        return result;
    }

}
}
