package org.robotlegs.examples.module
{
    import org.robotlegs.core.IInjector;
    import org.robotlegs.examples.module.model.vo.ModuleVO;
    import org.robotlegs.examples.module.widget.view.WidgetModule;
    
    public class ModuleFactory
    {
        [Inject]
        public var injector:IInjector;
        
        public function create(config:ModuleVO):WidgetModule
        {
            var module:WidgetModule = new WidgetModule();
            module.configure(config, injector);
            return module; 
        }
    }
}