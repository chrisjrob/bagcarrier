// bagcarrier.scad
// Simple carrier to help carry multiple shopping bags
// 
// Copyright 2013 Christopher Roberts

// Global Parameters
width     = 100;
height    = 100;
thickness =  10;

module bagcarrier() {

    difference() {

        // Things that exist
        union() {

            // handle and underbar
            for(x = [-height/2, 0]) {
                translate( v = [x, width/2, thickness/2] ) {
                    rotate( a = [90, 0, 0] ) {
                        cylinder( h = width, r = thickness/2 ); 
                    }
                }
            }

            // left and right bars
            for(y = [-width/2, width/2]) {
                translate( v = [-height/2, y, thickness/2] ) {
                    rotate( a = [0, 90, 0] ) {
                        cylinder( h = height * 0.5, r = thickness/2 ); 
                    }
                }
            }

            // Rounded corners for top and middle bars
            for(x = [-height/2, 0]) {
                for(y = [-width/2, width/2]) {
                    translate( v = [x, y, thickness/2] ) {
                        sphere( r = thickness/2 );
                    }
                }
            }

            // lower bars
            for( y = [-width/2 - thickness/4, -width/2 + width/3 - thickness/4, width/2 - width/3 - thickness/4, width/2 - thickness/4]) {
                // bars
                translate( v = [0, y, 0] ) {
                   cube( size = [ height * 0.33, thickness/2, thickness ] ); 
                }
            }

            // hoops
            for( y = [ -width/2 + width * 0.14 - thickness/4, -width/2 + width * 0.14 + width/3 - thickness/4, width/2 + width * 0.14 - width/3 - thickness/4]) {
                translate( v = [height/2 - height/6 - 1, y, 0] ) {
                    union() {
                        difference() {
                            cylinder( h = thickness, r = width * 0.14);
                            union() {
                                // remove centre of hoop
                                cylinder( h = thickness, r = width * 0.14 - thickness/2 );
                                // remove top half of hoop
                                translate( v = [-width/6,-width * 0.14,0] ) {
                                    cube( size = [ width/6, width/6*2, thickness ] );
                                }
                            }
                        }
                        // the extra bit above the hoop
                        translate( v = [-height/5,width * 0.14 - thickness/2,0] ) {
                            cube( size = [ height/5, thickness/2, thickness ] );
                        }
                    }
                }
            }

        }

    }

}

bagcarrier();

