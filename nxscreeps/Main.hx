//using screepslib.Game;
//import screepslib.Game;
//import src.Sam;
//using CreepZeroHarvester;
//import lib.nxscreeps.Samstuff.Sam;

//package nxscreeps;

//using nxscreeps.creepRoles.ZeroHarvester;
import nxscreeps.creepRoles.ZeroHarvester;
import nxscreeps.managers.SourceManager;


class Main {
    static function main() {
        var memory:Dynamic = untyped __js__('Memory');
        memory.doSourceScan = true;
        //memory.test = new Array<String>();
        //memory.test[0] = "cake";
        //memory.test[1] = "toast";
        /*
        if (memory.sourceSpots){
            if (memory.doSourceScan){
                var foundSources: Array<RoomObject> = new Array<RoomObject>();
                memory.sourceSpots = new Array<String>();
                for (room in Game.rooms){
                    if (room.controller.owner.username == "nexustix") {
                    //trace(">"+room.controller.owner.username+"<");
                    //trace(">"+room.controller.owner+"<");
                        for (source in room.find(105)){
                            foundSources.push(source);
                            //memory.sourceSpots.push(source);
                        }
                    }
                }
                for (k in 0...foundSources.length) {
                    memory.sourceSpots[k] = foundSources[k];
                }

            }

        }else{
            memory.sourceSpots = new Array<String>();
        }
        */
        SourceManager.refresh(memory, "nexustix");


        var CreepWant: Map<String, Int> = new Map<String, Int>();
        CreepWant["ZeroHarvester"]  = 1;
        CreepWant["Harvester"]      = memory.sourceSpots.length;
        CreepWant["Transporter"]    = 0;
        CreepWant["Engineer"]       = 0;
        CreepWant["Claimer"]        = 0;



        var CreepCount: Map<String, Int> = new Map<String, Int>();
        for (k in CreepWant.keys()){
            CreepCount[k] = 0;
        }
        for (creep in Game.creeps){
            switch creep.memory.role{
                case "ZeroHarvester":
                    CreepCount["ZeroHarvester"] = CreepCount["ZeroHarvester"] + 1;

                case "Harvester":
                    CreepCount["Harvester"] = CreepCount["Harvester"] + 1;

                case "Transporter":
                    CreepCount["Transporter"] = CreepCount["Transporter"] + 1;

                case "Engineer":
                    CreepCount["Engineer"] = CreepCount["Engineer"] + 1;

                case "Claimer":
                    CreepCount["Claimer"] = CreepCount["Claimer"] + 1;
            }
        }



        for (spawn in Game.spawns){
            var buget: Int = spawn.room.energyAvailable;
            for (k in CreepWant.keys()){
                if (CreepCount[k] < CreepWant[k]){
                    //trace(k +": "+ CreepCount[k] + " of " + CreepWant[k]);
                    switch k{
                        case "ZeroHarvester":
                            spawn.createCreep(ZeroHarvester.generateBlueprint(buget),null, {role: "ZeroHarvester"});

                        case "Harvester":
                            trace(k +": no blueprint ");

                        case "Transporter":
                            trace(k +": no blueprint ");

                        case "Engineer":
                            trace(k +": no blueprint ");

                        case "Claimer":
                            trace(k +": no blueprint ");
                    }
                }else{
                    //trace(k +": DONE " + CreepWant[k]);
                }
            }
            //trace(spawn.id);
            //spawn.createCreep(["move"]);

            //trace(i.energy);
            //trace("pong");
        }
        //for (Source)
        for(creep in Game.creeps){
            switch creep.memory.role{
                case "ZeroHarvester":
                    //trace(creep.memory.role +": no routine ");
                    ZeroHarvester.run(creep);

                case "Harvester":
                    trace(creep.memory.role +": no routine ");

                case "Transporter":
                    trace(creep.memory.role +": no routine ");

                case "Engineer":
                    trace(creep.memory.role +": no routine ");

                case "Claimer":
                    trace(creep.memory.role +": no routine ");
            }
            //var roomSources: Array<RoomObject> = creep.room.find(105);
            //var tmpSource: Source = cast(roomSources[0], Source);
            //if (creep.harvest(tmpSource) == -9){
                //creep.moveTo(tmpSource.pos);
            //}
        }
    }
}
