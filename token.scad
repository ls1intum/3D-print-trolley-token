$fn=64;

// Parameters for the disk
disk_diameter = 23.25;
disk_thickness = 2.33;
indent_depth = 1;
border_thickness = 1;
logo_height = 1;

// Calculating the indent diameter (to scale the logo)
indent_diameter = disk_diameter - 2 * border_thickness;

// Create the main disk with indent subtracted
module disk_with_indent() {
    // Main disk
    difference() {
        // Main body of the disk
        cylinder(d=disk_diameter, h=disk_thickness);
        
        // Subtract the indent from the top
        translate([0, 0, disk_thickness  - indent_depth])
            cylinder(d=indent_diameter, h=indent_depth+1);
    }
}

// Insert the SVG logo, scaled to fit the indent
module insert_logo() {
    // Import the SVG logo (assumed to be called "logo.svg")
    // The logo is scaled to fit the indent
    scale([indent_diameter/250, indent_diameter/250, 1])
        translate([-2, 0, disk_thickness - indent_depth/2])
            import("logo.svg", height=logo_height, center=true);
}

// Generate the disk and insert the logo
disk_with_indent();
insert_logo();
