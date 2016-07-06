//using screepslib.Game;
//import screepslib.Game;
//import src.Sam;
//using CreepZeroHarvester;
//import lib.nxscreeps.Samstuff.Sam;

//package nxscreeps;

class Main {
    static function main() {
        trace("test");
        //trace(Game.spawns.length);
        for (i in Game.spawns){
            //trace(i.id);
            i.createCreep(["move"]);
        }
    }
}
