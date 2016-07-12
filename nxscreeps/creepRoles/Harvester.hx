package nxscreeps.creepRoles;

class Harvester {
    public static function generateBlueprint(buget: Int): Array<String> {
        var body: Array<String> = new Array<String>();

        var moveBuget = Math.floor((buget / 50) / 2);

        for (i in 0...moveBuget){
            body.push("move");
        }

        buget = buget - (moveBuget*50);
        var workBuget = Math.floor( buget / 100 );

        for (i in 0...workBuget){
            body.push("work");
        }

        body.reverse();
        return body;
    }

    public static function think(creep: Creep) {
    }

    public static function act(creep: Creep) {
    }

    public static function run(creep: Creep) {
        think(creep);
        act(creep);
    }
}
