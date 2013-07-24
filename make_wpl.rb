
def main
	Dir.entries(".").each do |entry|											# Cycle through each file in cur dir	
		entry.chomp!
		entry.strip!
		if(File.file?(entry) && entry.end_with?(".zpl"))		# If file in directory is a .zpl
			efile = File.new(entry)														# Opens the original .zpl file
			nfilename = File.basename(entry, ".zpl") + ".wpl"	# Find the new filename
		
				# Create a new file, nfile, with the new filename
				File.open(nfilename, 'w') do |nfile|
				
					# For each line in the original file
					efile.each do |line|
						if(line =~ /<?zpl.*/)
							line.gsub!(/zpl/, "zpl")
							line.gsub!(/2/, "1")
							puts(line)
						end
						nfile.write(line)
					end
				end
			end
		end
	end


main