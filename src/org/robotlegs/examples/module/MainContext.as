package org.robotlegs.examples.module
{
    import flash.display.DisplayObjectContainer;
    
    import org.robotlegs.examples.module.controller.CreateModuleCommand;
    import org.robotlegs.examples.module.controller.ListModulesCommand;
    import org.robotlegs.examples.module.model.Modules;
    import org.robotlegs.examples.module.signal.CreateModuleSignal;
    import org.robotlegs.examples.module.signal.ListModulesSignal;
    import org.robotlegs.examples.module.signal.ModulesChangedSignal;
    import org.robotlegs.examples.module.view.BuilderView;
    import org.robotlegs.examples.module.view.ModuleConfiguratorView;
    import org.robotlegs.examples.module.view.model.BuilderViewModel;
    import org.robotlegs.examples.module.view.model.ModuleConfiguratorViewModel;
    import org.robotlegs.mvcs.SignalContext;

    public class MainContext extends SignalContext
    {
        private static const VIEW_PACKAGE:String = 'org.robotlegs.examples.module.view';
        
        public function MainContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
        {
            super(contextView, autoStartup);
        }

        public override function startup():void
        {
            viewMap.mapPackage(VIEW_PACKAGE);

            injector.mapSingleton(Modules);
            injector.mapSingleton(ModuleFactory);

            injector.mapSingleton(BuilderViewModel);
            injector.mapSingleton(ModuleConfiguratorViewModel);
            
            injector.mapSingleton(CreateModuleSignal);
            injector.mapSingleton(ListModulesSignal);
            injector.mapSingleton(ModulesChangedSignal);

            signalCommandMap.mapSignalClass(CreateModuleSignal, CreateModuleCommand); 

            ListModulesSignal(signalCommandMap.mapSignalClass(ListModulesSignal, ListModulesCommand)).dispatch();
        }
        
    }
}