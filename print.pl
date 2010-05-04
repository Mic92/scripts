#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  print.pl
#
#        USAGE:  ./print.pl  
#
#  DESCRIPTION:  a wrapper reading from stdin to print pdf using ps2pdf
#                (working well with Opera)
#      OPTIONS:  ---
# REQUIREMENTS:  no
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Mic92, 
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  18.09.2009 16:15:51
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;

local $/="\n\n\n";
my $ps=<stdin>;
open(WRITEPS, ">/tmp/test.ps");
print WRITEPS $ps;
close(WRITEPS);
system("ps2pdf /tmp/test.ps $ENV{HOME}/output.pdf");
unlink("/tmp/test.ps");
