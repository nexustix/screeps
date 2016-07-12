package nxscreeps.creepRoles;

import nxscreeps.util.CreepUtil;


class ZeroHarvester {

    public static function generateBlueprint(buget: Int): Array<String> {
        var body: Array<String> = new Array<String>();

        var moveBuget = Math.floor((buget / 50) / 2);

        for (i in 0...moveBuget){
            body.push("move");
        }

        buget = buget - (moveBuget*50);
        var workBuget = Math.floor( ( (buget - (buget / 3) ) / 100) );

        for (i in 0...workBuget){
            body.push("work");
        }

        buget = buget - (workBuget*100);
        var carryBuget = Math.floor(buget / 50);

        for (i in 0...carryBuget){
            body.push("carry");
        }

        body.reverse();
        return body;
    }

    public static function think(creep: Creep) {
        if (creep.carry["energy"] == 0){
            creep.memory.working = true;
        }
        if (creep.carry["energy"] >= creep.carryCapacity) {
            creep.memory.working = false;
        }

        //if (creep.memory.dropoff){

        //}else{
            //creep.memory.dropoff()
        var potentialDropoffs: Array<Structure> = CreepUtil.getEnergyStorages(creep.room);
        if ( !(potentialDropoffs.length < 1) ){
            creep.memory.dropoff = potentialDropoffs[0];
        }
        //}
    }

    public static function act(creep: Creep) {
        if (creep.memory.working){
            var roomSources: Array<RoomObject> = creep.room.find(105);
            var tmpSource: Source = cast(roomSources[0], Source);
            if (creep.harvest(tmpSource) == -9){
                creep.moveTo(tmpSource.pos);
            }
        }else{
            //var spawn: Array<StructureSpawn> = cast(creep.room.find(112));
            if (creep.transfer(creep.memory.dropoff, "energy") == -9){
                creep.moveTo(creep.memory.dropoff);
            }

        }
    }

    public static function run(creep: Creep) {
        think(creep);
        act(creep);
    }

    public static function test(): Void {
        trace("ping");
    }

}
