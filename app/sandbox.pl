#!/usr/bin/env perl
use strict;
use warnings;
use YAML::XS;
use Data::Printer;
use File::Slurp;
use FindBin qw($Bin);

use lib "$Bin/lib";

my $game_dir = "$Bin/../missions/";



sub loadGameFile {
	my $game_file = shift @_;
	my $game_path = $game_dir . $game_file;
	if (! -e $game_path) {
		die "Couldn't load $game_path\n";
	}
	my $raw_data = read_file($game_path);
	my $game_data = Load($raw_data);
	return $game_data;
}

my $game = loadGameFile('actioncastle.yaml');
p($game);
