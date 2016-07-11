package nxscreeps.managers;

class SourceManager {
    public static inline function refresh(memory: Dynamic, username: String): Void{
        if (memory.sourceSpots){
            if (memory.doSourceScan){
                //var foundSources: Array<RoomObject> = getSourcesInTerritory(username);
                var foundSources: Array<String> = getSourcesInTerritory(username);
                for (k in 0...foundSources.length) {
                    memory.sourceSpots[k] = foundSources[k];
                }
            }
        }else{
            memory.sourceSpots = new Array<String>();
        }
    }

    public static function getSourcesInTerritory(ownerName: String): Array<String>{
        //var foundSources: Array<RoomObject> = new Array<RoomObject>();
        var foundSources: Array<String> = new Array<String>();
        for (room in Game.rooms){
            if (room.controller.owner.username == ownerName) {
                for (source in room.find(105)){
                    //foundSources.push(source);
                    foundSources.push(cast(source, Source).id);
                }
            }
        }
        return foundSources;

    }

    public static function isSourceHarvested(id: String): Bool{
        for (i in Game.creeps){
            if (i.memory.role == "Harvester" && i.memory.target == id) {
                return true;
            }
        }
        return false;
    }
}
