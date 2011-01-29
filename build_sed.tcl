#!/usr/bin/tclsh
#
# build_sed.tcl -- Build the sed command to use for patching files
#
# Copyright (C) Youness Alaoui (KaKaRoTo)
#
# This software is distributed under the terms of the GNU General Public
# License ("GPL") version 3, as published by the Free Software Foundation.
#


proc replace { s } { return [string map {"\r" "" "\n" " " "/" "\\/" "\t" " " "&" "\\&"} $s] }
proc read_file { f } { set f [open $f]; set r [read $f]; close $f; string trim $r }

if {[expr [llength $argv] % 2] != 0 } {
   puts "Usage : $argv0 \[<match_string file> <replace_string file>\]+"
   exit
}

foreach {match replace} $argv {
   puts "s/[replace [read_file $match]]/[replace [read_file $replace]]/"
}
