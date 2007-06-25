# common/manifests/defines/line.pp -- a trivial puppet lined
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

# Usage:
# line { description:
# 	file => "filename",
# 	line => "content",
# 	ensure => {absent,present}
# }
define line($file, $line, $ensure) {
	case $ensure {
		default : { err ( "unknown ensure value $ensure" ) }
		present: {
			exec { "/bin/echo '$line' >> '$file'":
				unless => "/bin/grep -Fx '$line' '$file'"
			}
		}
		absent: {
			exec { "/usr/bin/perl -ni -e 'print unless /^\\Q$line\\E$/' '$file'":
				onlyif => "/bin/grep -Fx '$line' '$file'"
			}
		}
	}
}


