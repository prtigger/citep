#!/usr/bin/perl
use strict;

my (%mailheader, @maillist);
my $configname="/usr/local/etc/parsembox.cfg";
my @configuration;

my $filename = $ARGV[0] or die("usage: mbox.pl {filename}\n");

$filename =~ m!.*[/\\](.*)$!;
my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime();

my $backupname=sprintf("/backups/mail/%s_%02d.%02d.%d_%02d:%02d",$1,$mday,$mon+1,$year+1900,$hour,$min);
open(BACKUP, "> ${ backupname }") or die("Could not open backup file: $!\n");

open(MAIL, "< ${ filename }") or die("Could not open file ${ filename }: $!\n");
flock (MAIL, 2);

parse_config($configname);

my $state=1;
my $beginto;

while (<MAIL>)
{
    print BACKUP;
    chomp;
    
    $state=0 if (length($_) eq 0);
    
    if (($_ =~ m/^From\s/) && ($.>1))
    {
        process_message();
        undef (@maillist);
        undef (%mailheader);
        $state=1;
        $beginto=0;
    }
    elsif (( m/(^[\w\-\.]+):\s(.*\S)\s*$/) && $state)
    {
        my ($keyword,$value) = ($1, $2);
        if (lc($keyword) eq "to")
        {
            $beginto = 1;
        }
        else
        {
            $beginto = 0;
        }
        
        $mailheader{lc($keyword)} = $value if (defined($keyword) && defined($value));
    }
    
    push @maillist,$_;
    if ($beginto && !( m/(^[\w\-\.]+):\s(.*\S)\s*$/))
    {
        s/\s*//g;
        $mailheader{to} = $mailheader{to}.$_;
    }
}

process_message();

close (MAIL);
close BACKUP;
unlink $filename;
system ("/bin/gzip $backupname");

sub process_message
{
    my $from;
    if ($mailheader{from} =~ /<(.+)>/)
    {
        $from=$1;
    }
    else
    {
        $from=$mailheader{from};
    }
    my $to="";
    my $i;
    
    if (defined($mailheader{to}))
    {
        $i=check_mail ($from, $mailheader{to});
        if ($i>0)
        {
            logging ("adding mail for domain",$configuration[$i-1]->{domain});
            $,=$/;
            open (OUTF, ">> $configuration[$i-1]->{filename}") || die "Cannot open output file";
            print OUTF @maillist;
            print OUTF "\n";
            close OUTF;
        }
    }
}

sub check_mail            # check_chitterio (from_mail, to_mail)
{
    my $from=$_[0];
    my $to=$_[1];
    my $i;
    my (@mails, @excl_mails, $mail, $exc_mail);
    
    for $i (0..$#configuration)
    {
        @mails=GetMailsFromConfig($configuration[$i]->{mail});
        @excl_mails=GetMailsFromConfig($configuration[$i]->{exclmail});
        foreach $mail (@mails)
        {
            if ($from =~ /$mail/gi)
            {
                foreach $exc_mail (@excl_mails)
                {
                    return 0 if ($to =~/$exc_mail/);
                }
                return $i+1;
            }

            if ($to =~ /$mail/gi)
            {
                foreach $exc_mail (@excl_mails)
                {
                    return 0 if ($from =~/$exc_mail/);
                }
                return $i+1;
            }
        }
        
    }

    return 0;
}

sub parse_config
{
    my $configname=$_[0];
    my $config;
    
    open CFG, "< $configname";
    my $opensection=0;
    
    while (<CFG>)
    {
        chomp;
        s/#.*//;
        s/^\s+//;
        s/\s+$//;
        
        if (/^<domain>$/i)
        {
            $opensection=1;
            $config={};
        }
        elsif (/^<\/domain>\s*$/i && $opensection)
        {
            $opensection=0;
            push @configuration, $config;
        }
        elsif (/^(\w+)\s*=\s*(.*)$/ && $opensection)
        {
            my ($keyword,$value) = ($1, $2);
            $config->{lc($keyword)} = $value if (defined($keyword) && defined($value));
        }
    }
}

sub GetMailsFromConfig
{
    my @mails= split(",",$_[0]);
    for my $i (0 .. $#mails)
    {
        $mails[$i] =~ s/\s//g;
    }
    
    return @mails;
}

sub logging()
{
    
    my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime(time);
    
    $year += 1900;
    $mon++;
    open( LOGFILE, ">> /var/log/parsembox.log");
    my $strtime=sprintf ("%02d-%02d-%d %02d:%02d:%02d",$mday,$mon,$year,$hour,$min,$sec);
    print LOGFILE "$strtime -> ";
    foreach (@_)
    {
      print LOGFILE " ".$_;
    }
    print LOGFILE "\n";
    close LOGFILE;
}