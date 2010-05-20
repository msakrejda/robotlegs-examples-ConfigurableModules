package org.robotlegs.examples.module.view.model
{
    import org.robotlegs.examples.module.model.vo.ModuleVO;
    import org.robotlegs.examples.module.signal.CreateModuleSignal;
    
    public class ModuleConfiguratorViewModel
    {
        [Inject]
        public var createModule:CreateModuleSignal;
        
        public function create(config:ModuleVO):void
        {
            createModule.dispatch(config);
        }

        
    }
}