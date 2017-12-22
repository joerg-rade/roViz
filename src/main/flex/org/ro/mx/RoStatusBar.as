package org.ro.mx {
import mx.containers.HBox;
import mx.controls.Label;
import mx.controls.ProgressBar;

public class RoStatusBar extends HBox {

    public var user:Label;
    public var host:Label;

    public function RoStatusBar() {
        percentWidth = 100;
        height = 20;

        user = new Label();
        addChild(user);

        host = new Label();
        addChild(host);

        var progressBar:ProgressBar = new ProgressBar();
        progressBar.percentWidth = 100;
        progressBar.height = 2;
        progressBar.label = "";
        //progressBar.color="0xF79646"
        addChild(progressBar);
    }
}
}
