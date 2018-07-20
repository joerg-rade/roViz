package org.ro.core {

/**
 * Keeps a list of closed/minmized/docked views in order to recreate them.
 * When a tab is 'docked' it can be looked up here.
 * And instead of creating a view a second time, it can be taken from here.
 * setVisible(false) ?
 *
 * A unique id is required in order to be able to look it up and setVisible(true) again.
 */
public class ViewRegistry {

    private var delegate:Object;

    public function ViewRegistry() {
        delegate = new Object();
    }

    public function add(key:Object, value:Object):void {
        delegate[key] = value;
    }

    public function remove(key:Object):void {
        // is the key itself removed as well?
        add(key, null);
    }

    public function find(key:Object):Object {
        return delegate[key];
    }
}
}
