package org.ro.view.tab {
import flash.events.MouseEvent;

import mx.containers.VBox;

import org.ro.core.Globals;
import org.ro.view.IDockable;
import org.ro.view.ImageRepository;

public class BaseTab extends VBox implements IDockable {
    protected static const HUB:Globals = Globals.getInstance();

    private var defaultIcon:Class = ImageRepository.ObjectIcon;

    public function BaseTab() {
        this.icon = defaultIcon;
    }

    protected function mouseWheelHandler():void {
        systemManager.addEventListener("mouseWheel", bumpDelta, true);

        function bumpDelta(event:MouseEvent):void {
            event.delta *= 20;
        }
    }

    public function getIcon():Class {
        return icon;
    }

}
}
