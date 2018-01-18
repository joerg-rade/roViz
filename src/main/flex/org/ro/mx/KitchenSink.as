package org.ro.mx {
import com.flexponential.ResizeableTitleWindow;

import mx.containers.HBox;
import mx.containers.TabNavigator;
import mx.controls.DateChooser;
import mx.controls.Image;
import mx.controls.RichTextEditor;
import mx.core.UITextField;
import mx.events.CloseEvent;
import mx.managers.PopUpManager;

import org.ro.Globals;

public class KitchenSink extends ResizeableTitleWindow {

    public function KitchenSink(title:String = null) {
        this.title = title;
        width = 640;
        height = 480;
        addEventListener(CloseEvent.CLOSE, close);

        var tn:TabNavigator = new TabNavigator();
        tn.percentWidth = 100;
        tn.percentHeight = 100;
        this.addElement(tn);

        tn.addElement(rte());
        tn.addElement(calendar());
        tn.addElement(image());
        tn.addChild(iframe());

        PopUpManager.addPopUp(this, Globals.getView(), true);
        PopUpManager.centerPopUp(this);
    }

    private function rte():RichTextEditor {
        var rte:RichTextEditor = new RichTextEditor();
        rte.percentHeight = 100;
        rte.percentWidth = 100;
        rte.label = "RichTextEditor";
        rte.icon = ImageRepository.PencilIcon;
        return rte;
    }

    private function calendar():HBox {
        var cb:HBox = new HBox();
        cb.percentHeight = 100;
        cb.percentWidth = 100;
        cb.label = "Calendar";
        cb.icon = ImageRepository.CalendarIcon;
        var cal:DateChooser = new DateChooser();
        cal.percentHeight = 100;
        cal.percentWidth = 100;
        cb.addElement(cal);
        return cb;
    }

    private function image():HBox {
        var ib:HBox = new HBox();
        ib.percentHeight = 100;
        ib.percentWidth = 100;
        ib.label = "Image";
        ib.icon = ImageRepository.ObjectsIcon;
        var image:Image = new Image();
        image.source = new ImageRepository.AboutImage();
        image.percentHeight = 100;
        image.percentWidth = 100;
        ib.addElement(image);
        return ib;
    }

    // https://github.com/flex-users/flex-iframe/wiki/Users-guide
    private function iframe():HBox {
        var hb:HBox = new HBox();
        hb.percentHeight = 100;
        hb.percentWidth = 100;
        hb.label = "HTML from URL";
        hb.icon = ImageRepository.CheckIcon;
        var tf:UITextField = new UITextField();
        tf.htmlText = "<iframe src=\"https://www.w3schools.com\">You need a Frames capable browser to view this content.</iframe>";
        hb.addChild(tf);
        return hb;

//        function load(url:String) {
//            var request:URLRequest = new URLRequest(url);
//            request.method = URLRequestMethod.GET;
//
//            var loader:URLLoader = new URLLoader();
//            loader.addEventListener(LoadEvent.COMPLETE, handleLoaderComplete);
//            loader.load(request);
//        }
//
//        function handleLoaderComplete(event:LoadEvent):void {
//            tf.htmlText = event.result;
//        }
    }

    private function close(evt:CloseEvent):void {
        PopUpManager.removePopUp(this);
    }
}
}
