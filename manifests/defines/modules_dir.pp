# common/manifests/defines/modules_dir.pp -- create a default directory
# for storing module specific information
#
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

# Usage:
# include common::moduledir
# modules_dir { ["common", "common/dir1", "common/dir2" ]: }
#
# You may refer to a file in module_dir by using :
# file { "${common::moduledir::module_dir_path}/somedir/somefile": }

define modules_dir (
		$mode = 0644, $owner = root, $group = 0
	)
{
  include common::moduledir
	$dir = "$common::moduledir::module_dir_path/${name}"
	if defined(File[$dir]) {
		debug("${dir} already defined")
	} else {
		file {
			$dir:
				source => [ "puppet://$server/modules/${name}/modules_dir", "puppet://$server/modules/common/empty"],
				checksum => mtime,
				# ignore the placeholder
				ignore => '\.ignore', 
				recurse => true, purge => true, force => true,
				mode => $mode, owner => $owner, group => $group;
		}
	}
}

# alias for compatibility
define module_dir (
		$mode = 0644, $owner = root, $group = 0
	)
{
  modules_dir{$name: mode => $mode, owner => $owner, group => $group }
}
