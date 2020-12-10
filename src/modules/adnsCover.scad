include <../config.scad>;
use <../modules/shapes.scad>;
use <../modules/plate.scad>;

module adnsCover(){
    difference(){
        linear_extrude(STANDOFF_HEIGHT)
            difference(){
                circle(d = ADNS_PCB_DIAMETER);
                
                // bolts cutouts

                translate([0, SENSOR_PCB_MOUNT_OFFSET])
                    circle(d = BOLT_DIAMETER + BOLT_TOLERENCE * 2);

                translate([0, -SENSOR_PCB_MOUNT_OFFSET])
                    circle(d = BOLT_DIAMETER + BOLT_TOLERENCE * 2);

                // laser channel
                squircle(
                    size = [SENSOR_CHANNEL_WIDTH, SENSOR_CHANNEL_HEIGHT],
                    radius = 1,
                    center = true);
            }
        
        // cutout for sensor
        linear_extrude(SENSOR_LENS_HEIGHT_ABOVE_BOARD)
            squircle(
                size = [SENSOR_LENS_WIDTH, SENSOR_LENS_HEIGHT],
                radius = 4,
                center = true);
                
        // cutout to expose bottom rings
        linear_extrude(1)
            difference(){
                circle(d = ADNS_PCB_DIAMETER);

                translate([0, SENSOR_PCB_MOUNT_OFFSET])
                    circle(d = BOLT_DIAMETER + BOLT_TOLERENCE * 2 + 2);

                translate([0, -SENSOR_PCB_MOUNT_OFFSET])
                    circle(d = BOLT_DIAMETER + BOLT_TOLERENCE * 2 + 2);
            }
            
        // cutout for trackball
        translate([0, 0, getTrackballZ() + STANDOFF_HEIGHT])
            sphere(d = TRACKBALL_DIAMETER + 1);
    }    
}

adnsCover($fn = 20);