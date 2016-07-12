package nxscreeps.util;

class CreepUtil{
    public static inline function getEnergyStorages(room: Room): Array<Structure> {

        var foundStructures: Array<Structure> = new Array<Structure>();

        var structures: Array<Structure> = cast( room.find(untyped __js__('FIND_MY_STRUCTURES')) );

        for (i in structures) {
            //switch i.structureType {
                //case ConstStructure.STRUCTURE_SPAWN:
                    //if (cast(i, StructureSpawn).energy < cast(i, StructureSpawn).energyCapacity) {
                        //foundStructures.push(i);
                    //}
                //case ConstStructure.STRUCTURE_EXTENSION:
                    //if (cast(i, StructureExtension).energy < cast(i, StructureExtension).energyCapacity) {
                        //foundStructures.push(i);
                    //}

                //TODO add energy storage
            //}
        }

        var structures: Array<Structure> = cast( room.find(untyped __js__('FIND_MY_STRUCTURES')) );

        for (i in structures){
            //switch i.structureType {
                //case ConstStructure.STRUCTURE_CONTAINER:
                    //if (cast(i, StructureContainer).store[untyped __js__('RESOURCE_ENERGY')] < cast(i, StructureContainer).storeCapacity) {
                        //foundStructures.push(i);
                    //}
            //}
        }

        return foundStructures;
    }
}
