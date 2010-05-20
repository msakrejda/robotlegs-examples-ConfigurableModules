package org.robotlegs.examples.module.view.model
{
    import org.robotlegs.examples.module.signal.PokeModulesSignal;
    
    public class PokingViewModel
    {
        [Inject]
        public var pokeSignal:PokeModulesSignal;
        
        public function sendPoke():void
        {
            pokeSignal.dispatch();
        }

    }
}