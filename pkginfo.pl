#!/usr/bin/perl

$inputArgNum = scalar(@ARGV);
$option = $ARGV[0];
$rows = 0;

if ($inputArgNum == 2) {
	if ($option eq "-a"){
		open(INFILE,$ARGV[$inputArgNum-1]) or die "file ".$ARGV[$inputArgNum-1]." does not exist";
		while(<INFILE>){
		chomp;
		($cate, $name, $desc, $size)=split(/,/);
		@cate[$rows]=$cate;
		@name[$rows]=$name;
		@desc[$rows]=$desc;
		@size[$rows]=$size;
		$rows++;
		}
		if ($rows == 0){print "No software installed\n";}else{
			foreach my $n (@name){
					print "$n\n";
			}
		}
	}elsif($option eq "-s"){
		open(INFILE,$ARGV[$inputArgNum-1]) or die "file ".$ARGV[$inputArgNum-1]." does not exist";
		while(<INFILE>){
		chomp;
		($cate, $name, $desc, $size)=split(/,/);
		@cate[$rows]=$cate;
		@name[$rows]=$name;
		@desc[$rows]=$desc;
		@size[$rows]=$size;
		$rows++;
		}
		if ($rows == 0){print "Total size in kilobytes: 0\n";}else{
			$totalSize = 0;
			foreach my $s (@size){
				$totalSize += $s;
			}
			print "Total size in kilobytes: $totalSize\n";
		}
	}else {print "Invalid command syntax\n";}
}elsif ($inputArgNum == 3){
		if ($option eq "-l"){
			open(INFILE,$ARGV[$inputArgNum-1]) or die "file ".$ARGV[$inputArgNum-1]." does not exist";
			while(<INFILE>){
			chomp;
			($cate, $name, $desc, $size)=split(/,/);
			@cate[$rows]=$cate;
			@name[$rows]=$name;
			@desc[$rows]=$desc;
			@size[$rows]=$size;
			$rows++;
			}
			$flag = 0;
			for (my $i = 0;$i < $rows; $i++){
				if ($ARGV[1] eq "$name[$i]"){
					$flag = 1;
					print "Package $name[$i]:\n";
					print "Category: $cate[$i]\n";
					print "Description: $desc[$i]\n";
					print "Size in kilobytes: $size[$i]\n";	
				}
			}
			if ($flag == 0) {print "No installed package with this name\n";}
		}else {print "Invalid command syntax\n";}
}elsif ($inputArgNum == 1){
	if($option eq "-v"){
	print "Name: Wei\n";
	print "Surname: Liu\n";
	print "Student ID: 12489656\n";
	}else {print "Invalid command syntax\n"};
}else {
	print "Invalid command syntax\n";
}




