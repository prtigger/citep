#!/usr/bin/perl
use strict;
use Mail::IMAPClient;

my $imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "citterio.com\@local" ,
	Password=> "testing" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@citterio.com")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "tulipfood.ru\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@tulipfood.ru")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "cf-r.com\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@cf-r.com")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "valira.com\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@valira.com")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "labeyrie.fr\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@labeyrie.fr")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "groupeaoste.com\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@groupeaoste.com")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "tulip.dk\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@tulip.dk")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "klein-gmbh.com\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@klein-gmbh.com")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "berglandmilch.at\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@berglandmilch.at")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "castelli1892.com\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@castelli1892.com")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "bongrain.ru\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@bongrain.ru")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "emmi.ch\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@emmi.ch")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "forlasa.es\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@forlasa.es")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "bauli.it\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@bauli.it")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "noble-chocolates.com\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@noble-chocolates.com")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "chocoladen.de\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@chocoladen.de")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "walkers-shortbread.co.uk\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@walkers-shortbread.co.uk")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "destrooper.be\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@destrooper.be")))
{
   $imap->move("sent",$f);
}

$imap = Mail::IMAPClient->new( 
	Server 	=> "relief.ru" ,
	User 	=> "ceramicheilpino.it\@local" ,
	Password=> "progmatik" ,
) or die "can't connect to server\n";

$imap->select("inbox");

foreach my $f ($imap->search(qq(TO "\@ceramicheilpino.it")))
{
   $imap->move("sent",$f);
}

