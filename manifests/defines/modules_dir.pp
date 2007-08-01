# common/manifests/defines/modules_dir.pp -- create a default directory
# for storing module specific information
#
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

# Usage:
# modules_dir { ["common", "common/dir1", "common/dir2" ]: }
define modules_dir (
		$mode = 0755, $owner = root, $group = root
	)
{
	file {
		"/var/lib/puppet/modules/${name}":
			source => [ "puppet://$servername/${name}/modules_dir", "puppet://$servername/common/empty"], 
			checksum => mtime,
			recurse => true, purge => true, force => true,
			mode => $mode, owner => $owner, group => $group;
	}
}
