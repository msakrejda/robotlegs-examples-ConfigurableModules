package org.robotlegs.examples.module.signal
{
    import org.osflash.signals.Signal;
    import org.robotlegs.examples.module.model.vo.ModuleVO;

    public class CreateModuleSignal extends Signal
    {
        public function CreateModuleSignal()
        {
            super(ModuleVO);
        }
    }
}