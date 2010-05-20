package org.robotlegs.examples.module.signal
{
    import mx.collections.ArrayCollection;
    
    import org.osflash.signals.Signal;

    public class ModulesChangedSignal extends Signal
    {
        public function ModulesChangedSignal()
        {
            super(ArrayCollection);
        }
    }
}