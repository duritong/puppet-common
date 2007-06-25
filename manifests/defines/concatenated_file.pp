# common/manifests/defines/concatenated_file.pp -- create a file from snippets
# stored in a directory
#
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

# Usage:
# concatenated_file { "/etc/some.conf":
# 	dir => "/etc/some.conf.d",
# }
define concatenated_file ( $dir, $mode = 0644, $owner = root, $group = root ) {
	file {
		$dir:
			ensure => directory, checksum => mtime,
			mode => $mode, owner => $owner, group => $group;
		$name:
			ensure => present, checksum => md5,
			mode => $mode, owner => $owner, group => $group;
	}

	exec { "find ${dir} -maxdepth 1 -type f ! -name '*puppettmp' -print0 | sort -z | xargs -0 cat > ${name}":
		refreshonly => true,
		subscribe => File[$dir],
	}
}


