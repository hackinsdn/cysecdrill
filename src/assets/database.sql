-- Database dump simplified to work with MySQL and SQLite
BEGIN TRANSACTION;

-- --------------------------------------------------------

--
-- Structure for table `commands`
--

CREATE TABLE `commands` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `examples` text DEFAULT NULL,
  `tool` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `command` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  `example` varchar(150) DEFAULT NULL,
  `sudo` int(1) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL
);

--
-- Populate data for `commands`
--

--
-- Populate data for `commands`: nmap
--
INSERT INTO `commands` (`name`, `description`, `examples`, `tool`, `type`, `command`, `example`, `sudo`, `category`) VALUES
('Scan specific ports', NULL, 'nmap -p 80,443 8.8.8.8', 1, 'input', '-p', 'Specific: 80,443 OR Range: 1-65536', NULL, 'PORT SPECIFICATION AND SCAN ORDER'),
('Ping Scan - disable port scan', NULL, NULL, 1, 'checkbox', '-sL', NULL, NULL, 'HOST DISCOVERY'),
('Skip host discovery', NULL, NULL, 1, 'checkbox', '-Pn', NULL, NULL, 'HOST DISCOVERY'),
('Trace hop path to each host', NULL, NULL, 1, 'checkbox', '--traceroute', NULL, NULL, 'HOST DISCOVERY'),
('Use OSs DNS resolver', NULL, NULL, 1, 'checkbox', '--system-dns', NULL, NULL, 'HOST DISCOVERY'),
('Exclude hosts/networks', NULL, NULL, 1, 'input', '--exclude', 'Example: 192.168.0.1', NULL, 'TARGET SPECIFICATION'),
('Enable OS detection', NULL, NULL, 1, 'checkbox', '-O', NULL, NULL, 'OS DETECTION'),
('IP protocol scan', NULL, NULL, 1, 'checkbox', '-sO', NULL, NULL, 'SCAN TECHNIQUES'),
('FTP bounce scan', NULL, NULL, 1, 'checkbox', '-b', NULL, NULL, 'SCAN TECHNIQUES'),
('Exclude the specified ports from scanning', NULL, NULL, 1, 'input', '--exclude-ports', 'Specific: 80,443 OR Range: 1-65536', NULL, 'PORT SPECIFICATION AND SCAN ORDER'),
('Scan 100 most common ports', NULL, NULL, 1, 'checkbox', '-F', NULL, NULL, 'PORT SPECIFICATION AND SCAN ORDER'),
('Service detection (Standard)', NULL, NULL, 1, 'checkbox', '-sV', NULL, NULL, 'SERVICE/VERSION DETECTION'),
('OS detection, version, script scanning, and traceroute', NULL, NULL, 1, 'checkbox', '-A', NULL, NULL, 'MISC'),
('Print version number', NULL, NULL, 1, 'show', '-V', NULL, NULL, 'MISC'),
('Print this help summary page.', NULL, NULL, 1, 'show', '-h', NULL, NULL, 'MISC'),
('Enable IPv6 scanning', NULL, NULL, 1, 'checkbox', '-6', NULL, NULL, 'MISC'),
('Scan using UDP', NULL, NULL, 1, 'checkbox', '-sU', NULL, NULL, 'SCAN TECHNIQUES'),
('Scan for vulnerabilities', NULL, NULL, 1, 'checkbox', '-sS -sC -Pn --script vuln', 'nmap -sS -sC -Pn --script vuln scanme.nmap.org ', NULL, NULL),
('Scan for exploits', NULL, NULL, 1, 'checkbox', '-Pn -sS -sC --script exploit', 'nmap -Pn -sS -sC --script exploit scanme.nmap.org  ', NULL, NULL),
('Scan to test DoS attack vulnerability', NULL, NULL, 1, 'checkbox', '-Pn -sS -sC --script dos', 'nmap -Pn -sS -sC --script dos scanme.nmap.org ', NULL, NULL),
('Perform DoS attacks with a simulator', NULL, NULL, 1, 'checkbox', '--max-parallelism 750 -Pn --script http-slowloris --script-args http-slowloris.runforever=true', 'nmap --max-parallelism 750 -Pn --script http-slowloris --script-args http-slowloris.runforever=true scanme.nmap.org', NULL, NULL),
('Find subdomains', NULL, NULL, 1, 'checkbox', '-p 80 --script dns-brute.nse', 'nmap -p 80 --script dns-brute.nse vulnweb.com', NULL, NULL),
('Scan all 65535 ports', NULL, NULL, 1, 'checkbox', '-p-', NULL, NULL, NULL),
('Scan using TCP connect', NULL, NULL, 1, 'checkbox', '-sT', NULL, NULL, 'SCAN TECHNIQUES'),
('Scan common UDP ports', NULL, NULL, 1, 'checkbox', '-sU -p 53,123,138,161,162,68,69,500,4500,5600', NULL, NULL, NULL),
('Service detection (Agressive)', NULL, NULL, 1, 'checkbox', '--version-intensity 5', NULL, NULL, 'SERVICE/VERSION DETECTION'),
('Service detection (Lighter)', NULL, NULL, 1, 'checkbox', '-sV --version-intensity 0', NULL, NULL, 'SERVICE/VERSION DETECTION'),
('Scan using default safe scripts', NULL, NULL, 1, 'checkbox', '-sV -sC', NULL, NULL, NULL),
('Scan for UDP DDOS reflectors', NULL, NULL, 1, 'checkbox', '–sU –A –PN –n –pU:19,53,123,161 –script=ntp-monlist,dns-recursion,snmp-sysdescr', NULL, NULL, NULL),
('Gather page titles from HTTP services', NULL, NULL, 1, 'checkbox', '--script=http-title', NULL, NULL, 'HTTP Service Information'),
('Get HTTP headers of web services', NULL, NULL, 1, 'checkbox', '--script=http-headers', NULL, NULL, 'HTTP Service Information'),
('Find web apps from known paths', NULL, NULL, 1, 'checkbox', '--script=http-enum', NULL, NULL, NULL),
('Only show open (or possibly open) ports', NULL, NULL, 1, 'checkbox', '--open', NULL, NULL, NULL),
('Show host interfaces and routes', NULL, NULL, 1, 'checkbox', '--iflist', NULL, NULL, NULL),
('Scan using IP protocol ping', NULL, NULL, 1, 'checkbox', '-PO', NULL, NULL, NULL),
('Scan using UDP ping', NULL, NULL, 1, 'checkbox', '-PU', NULL, NULL, NULL),
('TCP Fin scan to check firewall', NULL, NULL, 1, 'checkbox', '-sF', NULL, NULL, 'Scan a firewall for security weakness'),
('TCP Xmas scan to check firewall', NULL, NULL, 1, 'checkbox', '-sX', NULL, NULL, 'Scan a firewall for security weakness'),
('TCP Null Scan to fool a firewall to generate a response', NULL, NULL, 1, 'checkbox', '-sN', NULL, NULL, 'Scan a firewall for security weakness'),
('Interfaces', NULL, NULL, 1, 'input', '-e', 'eth0', NULL, 'INTERFACE'),
('Timing template', 'Set timing template (higher is faster)', NULL, 1, 'input', '-T', '1-5', NULL, 'TIMING'),
('Host timeout', 'Give up on target after this long', NULL, 1, 'input', '--host-timeout', NULL, NULL, 'TIMING'),
('Scan delay', 'Adjust delay between probes', NULL, 1, 'input', '--scan-delay', NULL, NULL, 'TIMING'),
('Min rate', 'Send packets no slower than <number> per second', NULL, 1, 'input', '--min-rate', '10', NULL, 'TIMING'),
('Max rate', 'Send packets no faster than <number> per second', NULL, 1, 'input', '--max-rate', '100', NULL, 'TIMING'),
('Script', 'Comma separated list of directories, script-files or script-categories', NULL, 1, 'input', '--script', 'default', NULL, 'SCRIPTING'),
('Script args', 'Provide arguments to scripts', NULL, 1, 'input', '--script-args', NULL, NULL, 'SCRIPTING'),
('Script trace', 'Show all data sent and received', NULL, 1, 'checkbox', '--script-trace', NULL, NULL, 'SCRIPTING');

--
-- Populate data for `commands`: theHarvester
--
INSERT INTO `commands` (`name`, `description`, `examples`, `tool`, `type`, `command`, `example`, `sudo`, `category`) VALUES
('Perform a DNS TLD expansion', NULL, NULL, 3, 'checkbox', '-t', NULL, NULL, NULL),
('Perform a DNS brute force', NULL, NULL, 3, 'checkbox', '-c', NULL, NULL, NULL),
('Perform a DNS reverse query', NULL, NULL, 3, 'checkbox', '-n', NULL, NULL, NULL),
('Use this DNS server', NULL, NULL, 3, 'input', '-e', 'Set a DNS server', NULL, NULL),
('Limit the number of results to work with', NULL, NULL, 3, 'input', '-l', 'Google goes from 100 to 100', NULL, NULL),
('Start in result number', NULL, NULL, 3, 'input', '-s', 'Default 0', NULL, NULL),
('Data source', NULL, NULL, 3, 'input', '-b', 'Ex.: google,bing,linkedin', NULL, NULL),
('Verify host name and search for virtual hosts', NULL, NULL, 3, 'checkbox', '-v', NULL, NULL, NULL);

--
-- Populate data for `commands`: dnstracer
--
INSERT INTO `commands` (`name`, `description`, `examples`, `tool`, `type`, `command`, `example`, `sudo`, `category`) VALUES
('Use this source address', NULL, NULL, 8, 'input', '-S', NULL, NULL, NULL),
('Limit time to wait per try', NULL, NULL, 8, 'input', '-t', NULL, NULL, NULL),
('Don''t query IPv6 servers', NULL, NULL, 8, 'checkbox', '-4', NULL, NULL, NULL),
('Show all details and informations', NULL, NULL, 8, 'checkbox', '-v', NULL, NULL, NULL),
('Retry limit', NULL, NULL, 8, 'input', '-r', 'Ex: 1', NULL, NULL),
('Specific the register type', NULL, NULL, 8, 'input', '-q', 'Ex: A, AAA, MX, NS, TXT', NULL, NULL),
('Enable overview of received answers', NULL, NULL, 8, 'checkbox', '-o', NULL, NULL, NULL),
('Enable negative cache', NULL, NULL, 8, 'checkbox', '-C', NULL, NULL, NULL),
('Disable local caching', NULL, NULL, 8, 'checkbox', '-c', NULL, NULL, NULL);

--
-- Populate data for `commands`: dnstracer
--
INSERT INTO `commands` (`name`, `description`, `examples`, `tool`, `type`, `command`, `example`, `sudo`, `category`) VALUES
('Search', NULL, NULL, 15, 'input', 'search', 'To use this, clean target''s field.', NULL, NULL),
('Search emails with the local-part', NULL, NULL, 15, 'checkbox', '--local-part', NULL, NULL, NULL),
('Search emails with the password', NULL, NULL, 15, 'checkbox', '--password', NULL, NULL, NULL),
('Search emails with the domain', NULL, NULL, 15, 'checkbox', '--domain', NULL, NULL, NULL);

--
-- Populate data for `commands`: dnstracer
--
INSERT INTO `commands` (`name`, `description`, `examples`, `tool`, `type`, `command`, `example`, `sudo`, `category`) VALUES
('Traffic profile', NULL, NULL, 16, 'select', '-f astf/sfr_full_hackinsdn.py --astf#EMIX - Enterprise MIX traffic (customized by HackInSDN);-f cap2/dns.yaml#Simple DNS traffic;-f cap2/http_simple.yaml#Simple HTTP traffic;-f cap2/imix_hackinsdn_64_594_1518.yaml#IMIX - Internet MIX traffic (customized by HackInSDN)', NULL, NULL, NULL),
('Multiplier', NULL, NULL, 16, 'input', '-m', NULL, NULL, NULL),
('Duration', NULL, NULL, 16, 'input', '-d', NULL, NULL, NULL),
('Source addresses (list separated by +)', NULL, NULL, 16, 'input', '-t source', 'Example: 203.0.113.0/24+198.51.100.0/24', NULL, NULL),
('Destination addresses (list separated by +)', NULL, NULL, 16, 'input', '-t destination', 'Example: 192.0.2.0/24+198.18.0.0/15', NULL, NULL);

--
-- Populate data for `commands`: hping3
--
INSERT INTO `commands` (`name`, `description`, `examples`, `tool`, `type`, `command`, `value`, `example`, `sudo`, `category`) VALUES
('Packet count', 'Number of packages to send', 'hping3 --count 100', 18, 'input', '--count', '100', '100', NULL, 'COUNTER'),
('Interval', 'Wait X microseconds', 'hping3 --interval u1000', 18, 'input', '--interval', NULL, 'u10000', NULL, 'TIMER'),
('Debug', 'Debbuging info', 'hping3 --debug', 18, 'checkbox', '--debug', NULL, NULL, NULL, 'DEBUG'),
('Data size', NULL, 'hping3 --data 100', 18, 'input', '--data', NULL, '0', NULL, 'SIZE'),
('Verbose', 'Verbose mode', 'hping3 --verbose', 18, 'checkbox', '--verbose', NULL, NULL, NULL, 'DEBUG'),
('Fast', '10 packets for second (alias for --interval u10000)', 'hping3 --fast', 18, 'checkbox', '--fast', NULL, NULL, NULL, 'FLOOD'),
('Faster', '100 packets for second (alias for --interval u1000)', 'hping3 --faster', 18, 'checkbox', '--faster', NULL, NULL, NULL, 'FLOOD'),
('Flood', 'Send packets as fast as possible', 'hping3 --flood', 18, 'checkbox', '--flood', NULL, NULL, NULL, 'FLOOD'),
('Numeric output', 'No attempt will be made to lookup symbolic names for host addresses', 'hping3 --numeric', 18, 'checkbox', '--numeric', NULL, NULL, NULL, 'OUTPUT'),
('Quiet output', 'Nothing is displayed except the summary lines at startup time and when finished', 'hping3 --quiet', 18, 'checkbox', '--quiet', NULL, NULL, NULL, 'OUTPUT'),
('Mode', 'Default mode is TCP', 'hping3 --udp', 18, 'select', '#TCP Mode;--icmp #ICMP Mode; --udp #UDP Mode; --rawip #RawIP Mode; --scan #Scan Mode; --listen #Listen Mode', NULL, 'Yes', NULL, 'OUTPUT'),
('Destination port', 'UDP or TCP mode only', 'hping3 --destport 53', 18, 'input', '--destport', NULL, '53', 'Yes', NULL),
('Set do not fragment IP flag', 'IP mode only', 'hping3 --dontfrag', 18, 'checkbox', '--dontfrag', NULL, NULL, 'Yes', NULL),
('Split packets in more frag', 'IP mode only', 'hping3 --frag', 18, 'checkbox', '--frag', NULL, NULL, 'Yes', NULL),
('Spoof source address', 'IP mode only', 'hping3 --spoof IP_Addr', 18, 'input', '--spoof', NULL, '192.168.0.1', 'Yes', NULL),
('Random source address', 'IP mode only', 'hping3 --rand-source', 18, 'checkbox', '--rand-source', NULL, NULL, 'Yes', NULL),
('TTL', 'IP mode only', 'hping3 --ttl 64', 18, 'input', '--ttl', NULL, '64', 'Yes', NULL),
('MTU', 'IP mode only', 'hping3 --mtu MTU_Value', 18, 'input', '--mtu', NULL, NULL, 'Yes', NULL),
('ICMP Type', 'ICMP mode only', 'hping3 --icmptype ICMP_TYPE', 18, 'input', '--icmptype', NULL, '8', 'Yes', NULL),
('ICMP Code', 'ICMP mode only', 'hping3 --icmpcode ICMP_CODE', 18, 'input', '--icmpcode', NULL, '0', 'Yes', NULL),
('Source port', 'UDP or TCP mode only', 'hping3 --baseport 80', 18, 'input', '--baseport', NULL, '80', 'Yes', NULL),
('Set TCP ACK flag', 'TCP mode only', 'hping3 --ack', 18, 'checkbox', '--ack', NULL, NULL, 'Yes', NULL),
('Set TCP FIN flag', 'TCP mode only', 'hping3 --fin', 18, 'checkbox', '--fin', NULL, NULL, 'Yes', NULL),
('Set TCP SYN flag', 'TCP mode only', 'hping3 --syn', 18, 'checkbox', '--syn', NULL, NULL, 'Yes', NULL),
('Set TCP RST flag', 'TCP mode only', 'hping3 --rst', 18, 'checkbox', '--rst', NULL, NULL, 'Yes', NULL),
('Set TCP PUSH flag', 'TCP mode only', 'hping3 --push', 18, 'checkbox', '--push', NULL, NULL, 'Yes', NULL),
('Set TCP URG flag', 'TCP mode only', 'hping3 --urg', 18, 'checkbox', '--urg', NULL, NULL, 'Yes', NULL),
('Set interface', NULL, 'hping3 --interface', 18, 'input', '--interface', NULL, 'eth0', 'Yes', NULL);

-- --------------------------------------------------------

--
-- Structure for table `reports`
--

CREATE TABLE `reports` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `tools` varchar(100) DEFAULT NULL,
  `command` varchar(500) DEFAULT NULL,
  `output` text DEFAULT NULL,
  `solution` text DEFAULT NULL,
  `dataHour` datetime DEFAULT NULL
);

--
-- Populate data `reports`
--

INSERT INTO `reports` (`id`, `name`, `tools`, `command`, `output`, `solution`, `dataHour`) VALUES
(23, 'Teste', 'Nmap: the Network Mapper', 'nmap  -A localhost', '[sudo] senha para kali: Starting Nmap 7.70 ( https://nmap.org ) at 2019-06-28 16:26 -03\nNmap scan report for localhost (127.0.0.1)\nHost is up (0.000060s latency).\nOther addresses for localhost (not scanned): ::1\nNot shown: 998 closed ports\nPORT   STATE SERVICE VERSION\n22/tcp open  ssh     OpenSSH 7.9p1 Debian 10 (protocol 2.0)\n| ssh-hostkey: \n|   2048 93:c0:bd:e9:89:88:14:ba:0c:a0:a6:52:cb:a8:2e:0e (RSA)\n|   256 6c:81:1c:f9:e4:c0:7d:98:ea:8b:f4:41:58:ad:0e:75 (ECDSA)\n|_  256 55:08:ac:7c:6f:8f:0d:9c:c1:bf:e7:ae:1f:f8:eb:81 (ED25519)\n80/tcp open  http    nginx 1.14.2\n|_http-server-header: nginx/1.14.2\n|_http-title: Welcome to nginx!\nDevice type: general purpose\nRunning: Linux 3.X\nOS CPE: cpe:/o:linux:linux_kernel:3\nOS details: Linux 3.7 - 3.10\nNetwork Distance: 0 hops\nService Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel\n\nOS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .\nNmap done: 1 IP address (1 host up) scanned in 11.97 seconds\n', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n', '2019-06-28 16:27:13'),
(60, 'theHarvester', 'Gmail - Pesquisa de e-mails', 'python /home/kali/Downloads/theHarvester/theHarvester.py  -b google -l 50 -d gmail.com', '[-] Searching in Google:\n	Searching 0 results...\n\n[+] Emails found:\n------------------\nexample@gmail.com\nexamp1e@gmail.com\nfolha.campinas@gmail.com\nprodutividade.coop.rj@gmail.com\npereirabarbosa.joao@gmail.com\nhello@gmail.com\nhumoristarudy@gmail.com\naugustolessa.rj@gmail.com\nmaria.nazareth.52@gmail.com\nedilson@gmail.com\nselecaoll2017@gmail.com\nusername@gmail.com\nquermesse.restaurante@gmail.com\npickalimentos@gmail.com\nsucuricleanups2@gmail.com\nflaviag.neide@gmail.com\nAmazonasautomoveis@gmail.com\nAmazonasautomoveis@gmail.com\nilankriger@gmail.com\n2606iolanda@gmail.com\npousadatocadosursos@gmail.com\nadrientwu@gmail.com\nsniprosperidadevilasonia@gmail.com\nbeechamanda@gmail.com\njohn.doe@gmail.com\njohndoe@gmail.com\nmagi.tonis@gmail.com\ngustavo.brafman@gmail.com\nmfatima.silva22@gmail.com\nlmgrh1@gmail.com\nmarliquantica@gmail.com\npatimezzomo@gmail.com\nrefrig.ar.nilson@gmail.com\nneedessentials1@gmail.com\nneeraj.knit06@gmail.com\nJennyseomarketing010@gmail.com\njennyseomarketing010@gmail.com\njeanhtorres@gmail.com\nGuerillaClick@gmail.com\nguerillaclick@gmail.com\npousadacasadasfontes@gmail.com\nlucasgiovanny@gmail.com\nyourname@gmail.com\nyour.name@gmail.com\ny.o.u.r.n.a.m.e.@gmail.com\n11wcc.rio@gmail.com\nvfcadettes@gmail.com\nconveniadagremioviamao@gmail.com\nvovoanitagramado@gmail.com\nhotelkamomil@gmail.com\nchansookchoi@gmail.com\nxyz@mail.gmail.com\ncojacre@gmail.com\nrafabastos.1999@gmail.com\nggloriassousa@gmail.com\ninstitutoibrae@gmail.com\niaupe.carnaiba2019@gmail.com\nyourusername@gmail.com\n\n[+] Hosts found in search engines:\n------------------------------------\n172.217.30.5:www.gmail.com\n64.233.186.108:smtp.gmail.com\n64.233.190.108:imap.gmail.com\n', '<b>theHarvester</b> is a great tool for collecting information from a particular host, with it it is possible to get a list of emails, subdomains, hosts, employee names, open ports, banners from different public sources, PGP keys and mapped information by SHODAN.\r\n\r\n<h2 style=''color: white''>FIX THIS</h2>\r\n<p>\r\nThe information found by theHarvester is indexed in Internet pages. If you want to hide this content you need to identify in the source of this information.\r\nFor this, one can be applied techniques like Google Hacking to refine the search in search engines users by theHarvester.\r\n\r\nOnce the data source is identified, you can hide or delete the data, for example, from a social network. If it is a content of your own, such as a personal blog, just create a robots.txt file and hide the pages that have the information.\r\n</p>\r\n\r\n\r\n<h2 style=''color: white''>USEFUL LINKS</h2>\r\n<strong>\r\n  <a href=\"https://securitytrails.com/blog/google-hacking-techniques\" class=\"text-warning\">• Google Hacking Techniques</a><br>\r\n  <a href=\"https://www.searchenginejournal.com/best-practices-setting-meta-robots-tags-robots-txt/188655/\" class=\"text-warning\">• Best Practices robots.txt</a>\r\n\r\n</strong>', '2019-07-01 22:17:46'),
(62, 'Karma', 'Varredura example@gmail.com', 'karma  target example@gmail.com', '[sudo] password for kali: [32m[+] starting search [00m\n[32m[+] 1/1 request email: example@gmail.com [00m\n[32m[+] analyzing results: [00m\n[32m[+] 60 results found in 2.80s [00m\n\n\n	A J V T B Y 0 T 5\n	C U F I N 1 Q G V\n	P H R K A J C X M\n	I G F 4 T G E M K\n	T H J S U 2 G 1 9\n	8 B S B F W 0 R M\n	0 Z [1mK A R M A [0mA X\n	W 2 V T A C L 1 Z\n	Y 6 W G I V S 3 Z\n	X S E 6 E C S V D\n	G Q 7 B X N P U T\n	A 1 L X F W V Y 5\n\n	decoxviii\n	1.2.1\n\n+-------------------+----------------------------------+\n|       Email       |             Password             |\n+===================+==================================+\n| example@gmail.com | pokelion                         |\n| example@gmail.com | 89151321781                      |\n| example@gmail.com | 123qwe321Ewq                     |\n| example@gmail.com | buzzman                          |\n| example@gmail.com | 123qwe321Ewq                     |\n| example@gmail.com | santiago                         |\n| example@gmail.com | cynthia                          |\n| example@gmail.com | bob                              |\n| Example@gmail.com | eclips1                          |\n| example@gmail.com | 0987654321                       |\n| example@gmail.com | abc123458                        |\n| example@gmail.com | 790223                           |\n| example@gmail.com | ep8c4600                         |\n| example@gmail.com | 15032000                         |\n| example@gmail.com | 20101997                         |\n| example@gmail.com | sushi                            |\n| example@gmail.com | password                         |\n| example@gmail.com | ff6sadfa4325342235233243dsffds   |\n| example@gmail.com | gandjubasik_91                   |\n| example@gmail.com | kaylateam23                      |\n| example@gmail.com | andreev                          |\n| example@gmail.com | 1234560                          |\n| example@gmail.com | 15108302012                      |\n| example@gmail.com | 593555                           |\n| example@gmail.com | 12345                            |\n| example@gmail.com | gandjubasik_91                   |\n| example@gmail.com | asdfghjk                         |\n| example@gmail.com | 89506752655                      |\n| example@gmail.com | bagrat                           |\n| example@gmail.com | December                         |\n| example@gmail.com | Squid                            |\n| example@gmail.com | ekawebop                         |\n| example@gmail.com | lol                              |\n| example@gmail.com | stormy                           |\n| example@gmail.com | Example213                       |\n| example@gmail.com | 123123123                        |\n| Example@gmail.com | 1234567                          |\n| example@gmail.com | Connor12                         |\n| example@gmail.com | hi                               |\n| example@gmail.com | 08amy                            |\n| example@gmail.com | mastergamer12                    |\n| example@gmail.com | 1234567890                       |\n| example@gmail.com | 01012243                         |\n| example@gmail.com | loulou17                         |\n| example@gmail.com | hiseth                           |\n| example@gmail.com | elementqaz                       |\n| example@gmail.com | Volution                         |\n| example@gmail.com | 45165153                         |\n| example@gmail.com | 2346689512513                    |\n| example@gmail.com | fcea920f7412b5da7be0cf42b8c93759 |\n| example@gmail.com | hiltonlover77                    |\n| example@gmail.com | aak2002dn                        |\n| example@gmail.com | 1234567                          |\n| example@gmail.com | westpark1                        |\n| example@gmail.com | 123456                           |\n| example@gmail.com | pic                              |\n| example@gmail.com | example@gmail.com                |\n| example@gmail.com | scorpian7887                     |\n| example@gmail.com | 89506752655                      |\n| example@gmail.com | brantford1                       |\n+-------------------+----------------------------------+\n', '<b>Karma</b> find leaked emails with your passwords. If you have located a known password linked to your email, you MUST change it immediately.\r\n\r\n<h2 style=''color: white''>FIX THIS</h2>\r\n<p>It is recommended to <b>change the password of your email and all the services you use</b> (Facebook, Twitter, Snapchat, Instagram, Netflix, Spotify, etc). To do so, go to the official website or service app and change your password in SETTINGS.</p>\r\n\r\n<p><b>Create a strong password</b> that is totally different from the current one and avoid using personal data such as date of birth, name, cpf, etc. Combining letters, numbers and special characters will only increase your security.</p>\r\n\r\n<h2 style=''color: white''>PROTECTION</h2>\r\n<p>To increase your security, it is recommended that you <b>enable two-factor authentication</b>.</p>', '2019-07-05 09:09:55');

-- --------------------------------------------------------

--
-- Structure for table `tools`
--

CREATE TABLE `tools` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `fullname` varchar(150) DEFAULT NULL,
  `categories` varchar(300) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `github` varchar(500) DEFAULT NULL,
  `released` tinytext DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `cmd` varchar(100) DEFAULT NULL,
  `target` varchar(10) DEFAULT NULL,
  `resume` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `category2` varchar(100) DEFAULT NULL,
  `solution` text DEFAULT NULL
);

--
-- Populate data `tools`
--

INSERT INTO `tools` (`id`, `name`, `fullname`, `categories`, `description`, `site`, `github`, `released`, `avatar`, `cmd`, `target`, `resume`, `category`, `category2`, `solution`) VALUES
(1, 'Nmap', 'Nmap: the Network Mapper', 'information-gathering  vulnerability -analysis', 'https://tools.kali.org/information-gathering/nmap', 'https://insecure.org/', NULL, 'Yes', 'assets/img/nmap.jpg', 'nmap', NULL, 'Nmap (“Network Mapper”) is a free and open source (license) utility for network discovery and security auditing. Many systems and network administrators also find it useful for tasks such as network inventory, managing service upgrade schedules, and monitoring host or service uptime.', 'Information Gathering', 'Vulnerability Analysis', '<b>Nmap</b> works by checking a network for hosts and services. Once found, the software platform sends information to those hosts and services which then respond.\r\n\r\n<h2 style=''color: white''>FIX THIS</h2>\r\n<p></p>\r\n\r\n\r\n<h2 style=''color: white''>PROTECTION</h2>\r\n<p></p>'),
(2, 'BetterCap', 'bettercap', 'sniffing-spoofing', 'https://tools.kali.org/sniffingspoofing/bettercap', 'https://www.bettercap.org/', NULL, NULL, 'assets/img/bettercap.jpg', 'bettercap', NULL, NULL, 'Sniffing & Spoofing', NULL, NULL),
(3, 'theHarvester', 'theHarvester', 'information-gathering ', 'https://tools.kali.org/information-gathering/theharvester', NULL, 'https://github.com/laramies/theHarvester', NULL, NULL, 'python /home/kali/Downloads/theHarvester/theHarvester.py', '-d', 'The objective of this program is to gather emails, subdomains, hosts, employee names, open ports and banners from different public sources like search engines, PGP key servers and SHODAN computer database.', 'Information Gathering', NULL, '<b>theHarvester</b> is a great tool for collecting information from a particular host, with it it is possible to get a list of emails, subdomains, hosts, employee names, open ports, banners from different public sources, PGP keys and mapped information by SHODAN.\r\n\r\n<h2 style=''color: white''>FIX THIS</h2>\r\n<p>\r\nThe information found by theHarvester is indexed in Internet pages. If you want to hide this content you need to identify in the source of this information.\r\nFor this, one can be applied techniques like Google Hacking to refine the search in search engines users by theHarvester.\r\n\r\nOnce the data source is identified, you can hide or delete the data, for example, from a social network. If it is a content of your own, such as a personal blog, just create a robots.txt file and hide the pages that have the information.\r\n</p>\r\n\r\n\r\n<h2 style=''color: white''>USEFUL LINKS</h2>\r\n<strong>\r\n  <a href=\"https://securitytrails.com/blog/google-hacking-techniques\" class=\"text-warning\">• Google Hacking Techniques</a><br>\r\n  <a href=\"https://www.searchenginejournal.com/best-practices-setting-meta-robots-tags-robots-txt/188655/\" class=\"text-warning\">• Best Practices robots.txt</a>\r\n\r\n</strong>'),
(4, 'Nikto', 'Nikto', 'information-gathering  web-applications', 'https://tools.kali.org/information-gathering/nikto', 'https://www.cirt.net/Nikto2', 'https://github.com/sullo/nikto', NULL, 'assets/img/nikto.png', 'nikto', '-h', NULL, 'Information Gathering', 'Web Applications', NULL),
(5, 'Aircrack-ng', 'Airckack-ng', 'wireless- attacks', 'https://tools.kali.org/wireless-attacks/aircrack-ng', 'https://www.aircrack-ng.org/doku.php?id=aircrack-ng', 'https://gitlab.com/kalilinux/packages/aircrack-ng', NULL, NULL, NULL, NULL, NULL, 'Wireless Attacks', NULL, NULL),
(6, 'THC-Hydra', 'THC-Hydra', 'password-attacks', 'https://tools.kali.org/password-attacks/hydra', 'http://freeworld.thc.org/thc-hydra/', NULL, NULL, 'assets/img/hydrathc.jpg', NULL, NULL, NULL, 'Password Attacks', NULL, NULL),
(7, 'WPScan', 'WordPress Vulnerability Scanner', 'web-applications', 'https://tools.kali.org/web-applications/wpscan', 'http://wpscan.org/', 'https://github.com/wpscanteam/wpscan', NULL, 'assets/img/wpscan.png', 'wpscan', '--url', 'WPScan is a black box WordPress vulnerability scanner that can be used to scan remote WordPress installations to find security issues.', 'Web Applications', NULL, NULL),
(8, 'Dnstracer', 'dnstracer', 'information-gathering', 'https://tools.kali.org/information-gathering/dnstracer', 'http://freshmeat.net/projects/dnstracer', NULL, NULL, NULL, 'dnstracer', NULL, 'dnstracer determines where a given Domain Name Server (DNS) gets its information from for a given hostname, and follows the chain of DNS servers back to the authoritative answer.', 'Information Gathering', NULL, NULL),
(10, 'Sqlninja', 'Sqlninja', 'vulnerability-analysis  web-applications', 'https://tools.kali.org/vulnerability-analysis/sqlninja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Vulnerability Analysis', 'Web Applications', NULL),
(11, 'Powerfuzzer', 'Powerfuzzer', 'vulnerability-analysis  web-applications', 'https://tools.kali.org/vulnerability-analysis/powerfuzzer', 'https://www.powerfuzzer.com/', NULL, NULL, NULL, NULL, NULL, NULL, 'Vulnerability Analysis', 'Web Applications', NULL),
(12, 'ProxyStrike', 'ProxyStrike', 'web-applications', 'https://tools.kali.org/web-applications/proxystrike', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Web Applications', NULL, NULL),
(14, 'Dnsenum', 'Dnsenum', 'information-gathering', 'https://tools.kali.org/information-gathering/dnsenum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Information Gathering', NULL, NULL),
(15, 'Karma', 'Karma', 'information-gathering', NULL, NULL, 'https://github.com/decoxviii/karma', NULL, 'assets/img/github.jpg', 'karma', 'target', 'Find leaked emails with your passwords.', 'Information Gathering', NULL, '<b>Karma</b> find leaked emails with your passwords. If you have located a known password linked to your email, you MUST change it immediately.\r\n\r\n<h2 style=''color: white''>FIX THIS</h2>\r\n<p>It is recommended to <b>change the password of your email and all the services you use</b> (Facebook, Twitter, Snapchat, Instagram, Netflix, Spotify, etc). To do so, go to the official website or service app and change your password in SETTINGS.</p>\r\n\r\n<p><b>Create a strong password</b> that is totally different from the current one and avoid using personal data such as date of birth, name, cpf, etc. Combining letters, numbers and special characters will only increase your security.</p>\r\n\r\n<h2 style=''color: white''>PROTECTION</h2>\r\n<p>To increase your security, it is recommended that you <b>enable two-factor authentication</b>.</p>'),
(16, 'TRex', 'TRex: Realistic Traffic Generator', 'benign script-driven', 'https://trex-tgn.cisco.com', 'https://trex-tgn.cisco.com', 'https://github.com/cisco-system-traffic-generator', 'Yes', 'assets/img/trex.png', 'trex', NULL, 'TRex is an open source, low cost, stateful and stateless traffic generator fuelled by DPDK. It generates L3-7 traffic, and supports Stateless and Advanced Stateful functionality.', 'Benign', 'Script-driven', '<b>TRex</b> works by generating traffic using a stateless and statefull approach.\r\n\r\n<h2 style=''color: white''>FIX THIS</h2>\r\n<p></p>\r\n\r\n\r\n<h2 style=''color: white''>PROTECTION</h2>\r\n<p></p>'),
(17, 'httperf', 'httperf', 'benign application-level', 'https://github.com/httperf/httperf', 'https://github.com/httperf/httperf', 'https://github.com/httperf/httperf', NULL, NULL, 'httperf', NULL, NULL, 'Benign', 'Application level', '<b>NameTool</b> is aimed at testing the performance of a cybersecurity tools by generating real background network traffic.\r\n\r\n<h2 style=''color: white''>FIX THIS</h2>\r\n<p>TODO change me, <b>change me!</b> (XPTO, Foobar, etc). <p>Testing 123, tool to generate traffic security.</p>\r\n\r\n<h2 style=''color: white''>PROTECTION</h2>\r\n<p>To increase your security, it is recommended that you <b>enable two-factor authentication</b>.</p>'),
(18, 'hping3', 'hping3', 'benign throughput', 'http://www.hping.org', 'https://www.kali.org/tools/hping3/', NULL, 'Yes', 'assets/img/hping.svg', 'hping3', NULL, NULL, 'Benign', 'Throughput', '<b>hping</b> is aimed at testing the performance of a NIDS by replaying real background network traffic in which to hide attacks. Tcpreplay allows you to control the speed at which the traffic is replayed, and can replay arbitrary tcpdump traces.\r\n\r\n<h2 style=''color: white''>FIX THIS</h2>\r\n<p>TODO change me, <b>change me!</b> (XPTO, Foobar, etc). <p>Testing 123, tool to generate traffic security.</p>\r\n\r\n<h2 style=''color: white''>PROTECTION</h2>\r\n<p>To increase your security, it is recommended that you <b>enable two-factor authentication</b>.</p>'),
(19, 'iperf3', 'iperf3', 'benign throughput', 'https://iperf.fr', 'https://iperf.fr', 'https://github.com/esnet/iperf', NULL, NULL, 'iperf3', NULL, NULL, 'Benign', 'Throughput', '<b>iperf3</b> is aimed at testing the performance of a NIDS by replaying real background network traffic in which to hide attacks. Tcpreplay allows you to control the speed at which the traffic is replayed, and can replay arbitrary tcpdump traces.\r\n\r\n<h2 style=''color: white''>FIX THIS</h2>\r\n<p>TODO change me, <b>change me!</b> (XPTO, Foobar, etc). <p>Testing 123, tool to generate traffic security.</p>\r\n\r\n<h2 style=''color: white''>PROTECTION</h2>\r\n<p>To increase your security, it is recommended that you <b>enable two-factor authentication</b>.</p>'),
(20, 'd-itg', 'd-itg', 'benign model-based', 'https://traffic.comics.unina.it/software/ITG/', 'https://sources.debian.org/src/d-itg/', NULL, NULL, NULL, 'd-itg', NULL, NULL, 'Benign', 'Model-based', '<b>NameTool</b> is aimed at testing the performance of a cybersecurity tools by generating real background network traffic.\r\n\r\n<h2 style=''color: white''>FIX THIS</h2>\r\n<p>TODO change me, <b>change me!</b> (XPTO, Foobar, etc). <p>Testing 123, tool to generate traffic security.</p>\r\n\r\n<h2 style=''color: white''>PROTECTION</h2>\r\n<p>To increase your security, it is recommended that you <b>enable two-factor authentication</b>.</p>');


COMMIT;
