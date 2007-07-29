# common/manifests/defines/concatenated_file.pp -- create a file from snippets
# stored in a directory
#
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

# TODO:
# * get rid of the $dir parameter
# * create the directory in _part too

# Usage:
# concatenated_file { "/etc/some.conf":
# 	dir => "/etc/some.conf.d",
# }
# Use Exec["concat_$name"] as Semaphor
define concatenated_file (
	$dir, $mode = 0644, $owner = root, $group = root 
	)
{
	file {
		$dir:
			source => "puppet://$servername/common/empty",
			checksum => mtime,
			recurse => true, purge => true,
			mode => $mode, owner => $owner, group => $group;
		$name:
			ensure => present, checksum => md5,
			mode => $mode, owner => $owner, group => $group;
	}

	exec { "/usr/bin/find ${dir} -maxdepth 1 -type f ! -name '*puppettmp' -print0 | sort -z | xargs -0 cat > ${name}":
		# refreshonly => true,
		subscribe => File[$dir],
		before => File[$name],
		alias => "concat_${name}",
	}
}


# Add a snippet called $name to the concatenated_file at $dir.
# The file can be referenced as File["cf_part_${name}"]
define concatenated_file_part (
	$dir, $content = '', $ensure = present,
	$mode = 0644, $owner = root, $group = root 
	)
{

	file { "${dir}/${name}":
		ensure => $ensure, content => $content,
		mode => $mode, owner => $owner, group => $group,
		alias => "cf_part_${name}",
	}

}
