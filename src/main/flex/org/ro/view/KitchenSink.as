package org.ro.view {
import flash.text.Font;

import mx.containers.HBox;
import mx.containers.TabNavigator;
import mx.containers.TitleWindow;
import mx.controls.DateChooser;
import mx.controls.Image;
import mx.controls.RichTextEditor;
import mx.controls.Tree;
import mx.core.UITextField;
import mx.events.CloseEvent;
import mx.managers.PopUpManager;

import org.ro.core.Globals;

//TODO Windows should always be resizeable
//TODO add FileSystemDataGrid
//TODO add FileSystemTree
public class KitchenSink extends TitleWindow {

    [Embed(source="/../resources/fonts/Chicago.ttf",
            fontName="Chicago",
            fontWeight="normal",
            fontStyle="normal",
            mimeType="application/x-font",
            advancedAntiAliasing="true",
            embedAsCFF="false",
            unicodeRange="U+0020-U+002F,U+0030-U+0039,U+003A-U+0040,U+0041-U+005A,U+005B-U+0060,U+0061-U+007A,U+007B-U+007E,U+00A1-U+00A1,U+00A3-U+00A3,U+00A9-U+00A9,U+00AE-U+00AE,U+00B0-U+00B0,U+00BC-U+00BE,U+00BF-U+00BF,U+00C0-U+00FF,U+2013-U+2014,U+2018-U+2019,U+201C-U+201D,U+2022-U+2023,U+2120-U+2120,U+2122-U+2122")]
    private static const chicago:Class;

    public function KitchenSink(title:String = null) {
        this.title = title;
        this.showCloseButton = true;
        addEventListener(CloseEvent.CLOSE, close);

        var tn:TabNavigator = new TabNavigator();
        this.addElement(tn);

        tn.addElement(rte());
        tn.addElement(font());
        tn.addElement(calendar());
        tn.addElement(image());
        tn.addElement(tree());
        tn.addChild(iframe());

        PopUpManager.addPopUp(this, Globals.getInstance().getView(), true);
        PopUpManager.centerPopUp(this);
    }

    private function tree():HBox {
        var t:HBox = new HBox();
        t.label = "Tree";
        t.icon = ImageRepository.LogIcon;
        var st:SampleTree = new SampleTree();
        var tree:Tree = new Tree();
        tree.x = 8;
        tree.y = 40;
        tree.percentHeight = 100;
        tree.percentWidth = 100;
        tree.dataProvider = st.companyData;
        tree.labelField = "@label";

        t.addChild(tree);

        return t;
    }

    private function rte():RichTextEditor {
        var rte:RichTextEditor = new RichTextEditor();
        rte.percentHeight = 100;
        rte.percentWidth = 100;
        rte.label = "RichTextEditor";
        rte.icon = ImageRepository.PencilIcon;
        return rte;
    }

    private function font():HBox {
        Font.registerFont(chicago);
        var f:HBox = new HBox();
        f.label = "Font";
        f.icon = ImageRepository.TimesIcon;

        f.setStyle("embedFonts", true);
        f.setStyle("fontFamily", "Chicago");
        f.setStyle("fontSize", 12);

        var tf:UITextField = new UITextField();
        tf.multiline = true;
        tf.wordWrap = true;
        tf.text = "The quick brown fox jumps over the layz elefont";
        f.addChild(tf);

        return f;
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
