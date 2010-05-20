package org.robotlegs.examples.module.model
{
    import mx.collections.ArrayCollection;
    
    import org.robotlegs.examples.module.model.vo.ModuleVO;
    import org.robotlegs.examples.module.signal.ModulesChangedSignal;
    
    public class Modules
    {
        [Inject]
        public var modulesChanged:ModulesChangedSignal;

        private var _modules:ArrayCollection;

        public function Modules()
        {
            _modules = new ArrayCollection();
        }

        public function listModules()
        {
            modulesChanged.dispatch(_modules);
        }

        public function addModule(config:ModuleVO):void
        {
            _modules.addItem(config);
            listModules();
        } 
    }
}