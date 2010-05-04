#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  schueler.cc.pl
#
#        USAGE:  ./schueler.cc.pl  
#
#  DESCRIPTION:  check for unread messages on the student platform schueler.cc
#
#      OPTIONS:  ---
# REQUIREMENTS:  WWW-Mechanize (debian: libwww-mechanize-perl)
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Mic92 (), 
#      COMPANY:  
#      CREATED:  07.09.2009 15:30:17
#     REVISION:  ---
#===============================================================================

use strict;
use 5.010;

use WWW::Mechanize;

# Basic configuration
my $username = 'myname@example.com';
my $password = 'secret';

my $m = WWW::Mechanize->new( cookie_jar => {} );

$m->get('http://www.schueler.cc/index.php');
$m->success() or die "Can't reach schueler.cc";
$m->form_number(3);
$m->field('email', $username);
$m->field('passwort', $password);
$m->click('button_login_login');

my $url = $m->uri()->as_string;
print $url;

my $content =  $m->content();

# match with: .. <b>[ 1 ] neue Nachricht</b></a></div> ..
if ($content =~ /\[ (\w) \] neue Nachricht/) {
	say "Nachrichten: $1"; 
}
elsif ($content =~ /- nichts Neues -/){
	say 'keine Nachrichten';
}
