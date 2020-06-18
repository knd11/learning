#!/usr/bin/perl5.28 

eval 'exec /usr/bin/perl  -S $0 ${1+"$@"}'
    if 0; # not running under some shell

require IO::Stty;

foreach $param (@ARGV) {
  push (@params,split(/\s/,$param));
}
$stty = IO::Stty::stty(\*STDIN,@params);
if ($stty ne '0 but true') {
  print $stty;
}
