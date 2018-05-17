package org.ro.view.dlg {
import mx.containers.TitleWindow;

/**
 * simple user notification
 */
public class Message extends TitleWindow {

    override public function Message(text:String) {
        super();
        //TODO add type (INFO | WARN | ERROR | FATAL), icon, etc.
        super.title = text;
    }

}
}
