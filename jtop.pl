#!/usr/bin/perl
open LOG, $ARGV[0] or die $!;
print "PID\tCPU\tMem\tJStack Info\n";
while ($l = <LOG>) {
    @values = split(/(?<!^)\s+/, $l);
    $pct = $values[8];
    $mem = $values[5];
    $pid = $values[0];
    $hex_pid = sprintf("%#x", $pid);
    open JSTACK, $ARGV[1] or die $!;
    while ($j = <JSTACK>){
        if ($j =~ /.*nid=.*/){
            if ($j =~ /.*$hex_pid.*/){
                $j =~ s/\n//;
                $pid =~ s/\n//;
                print $pid . "\t" . $pct . "\t" . $mem . "\t" .  $j . "\n";
            }
        }
    }
    close JSTACK;
}
close LOG;