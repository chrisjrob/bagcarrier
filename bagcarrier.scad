// bagcarrier.scad
// Simple carrier to help carry multiple shopping bags
// 
// Copyright (C) 2013 Christopher Roberts
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

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

