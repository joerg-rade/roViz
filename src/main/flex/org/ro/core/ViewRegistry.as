package org.ro.core {
/**
 * Keeps a list of closed/minmized/docked views in order to be able to recreate them.
 * When a tab is 'docked' it can be looked up here.
 * And instead of creating a view a second time, it can be taken from here.
 * setVisible(false) ?
 * 
 * A unique id is required in order to be able to look it up and setVisible(true) again.
 */
public class ViewRegistry {
    public function ViewRegistry() {
    }
}
}
