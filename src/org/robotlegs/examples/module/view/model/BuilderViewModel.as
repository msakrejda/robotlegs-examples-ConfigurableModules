package org.robotlegs.examples.module.view.model
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    
    import mx.collections.ArrayCollection;
    
    import org.robotlegs.examples.module.signal.ModulesChangedSignal;
    
    public class BuilderViewModel extends EventDispatcher
    {
        private var _moduleList:ArrayCollection;

        [Inject]
        public var modulesChanged:ModulesChangedSignal;
        
        [PostConstruct]
        public function wireMappings():void
        {
            modulesChanged.add(updateModuleList);            
        }

        private function updateModuleList(list:ArrayCollection):void
        {
            _moduleList = list;
            dispatchEvent(new Event('moduleListChanged'));
        }
        
        [Bindable(event='moduleListChanged')]
        public function get moduleList():ArrayCollection
        {
            return _moduleList;
        }

    }
}