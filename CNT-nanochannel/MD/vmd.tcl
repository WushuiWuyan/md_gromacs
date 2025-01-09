#
mol new nvtnew.gro type gro
mol addfile pull.xtc type xtc first 1 last -1 step 1 filebonds 1 autobonds 1 waitfor all

set numFrame [molinfo top get numframes]
set out [open diffusion.txt w ]
for {set i 0} {$i < $numFrame} {incr i} {
set waternumber [atomselect top "(water and name OW and z 70 to 130)" frame $i]
set w1 [atomselect top "(water and name OW and z < 70)" frame $i]
set w2 [atomselect top "(water and name OW and z > 130)" frame $i]
set a [$waternumber num]
set a1 [$w1 num]
set a2 [$w2 num]
puts $out "$i $a1 $a $a2"
}
close $out
exit
#

