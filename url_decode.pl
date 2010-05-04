#!/usr/bin/perl 
use strict;
use warnings;

use URI::Escape;

while(<>){
	print uri_unescape($_);
}
