package org.ro.xhr {
import mx.core.FlexGlobals;

import org.ro.mx.IconRepository;

public class XhrLogEntry {
    public var icon:Class;
    public var url:String;
    public var start:Date;
    public var offset:int;
    public var fault:String;
    public var size:int;
    public var duration:int = 0;

    public function XhrLogEntry(url:String) {
        this.start = new Date();
        this.url = url;
        this.icon = IconRepository.YellowIcon;
    }

    private function calculate():void {
        this.duration = new Date().time - start.time;
        var logStartTime:int = FlexGlobals.topLevelApplication.view.dsp.log.getLogStartTime();
        this.offset = start.time - logStartTime;
    }

    public function setError(fault:String):void {
        this.calculate();
        this.fault = fault;
        this.icon = IconRepository.RedIcon;
    }

    public function setSuccess(size:int):void {
        this.calculate();
        this.size = size;
        this.icon = IconRepository.GreenIcon;
    }
    
}
}
