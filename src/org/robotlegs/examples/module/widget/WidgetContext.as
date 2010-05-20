package org.robotlegs.examples.module.widget
{
    import flash.display.DisplayObjectContainer;
    import flash.system.ApplicationDomain;
    
    import org.robotlegs.core.IInjector;
    import org.robotlegs.examples.module.model.vo.ModuleVO;
    import org.robotlegs.examples.module.widget.view.WidgetModule;
    import org.robotlegs.examples.module.widget.view.model.WidgetModel;
    import org.robotlegs.mvcs.SignalContext;

    public class WidgetContext extends SignalContext
    {
        private var _config:ModuleVO;

        public function WidgetContext(config:ModuleVO, contextView:DisplayObjectContainer, parentInjector:IInjector, autoStart:Boolean=true)
        {
            _config = config;
            if (parentInjector) {
                // TODO: handle app domains
                var childInjector:IInjector = parentInjector.createChild(ApplicationDomain.currentDomain);
                _injector = childInjector;
            }
            super(contextView, autoStart);
        }
        
        public override function startup():void
        {
            injector.mapSingleton(WidgetModel);

            injector.mapValue(ModuleVO, _config);

            viewMap.mapType(WidgetModule);
        }

        
    }
}