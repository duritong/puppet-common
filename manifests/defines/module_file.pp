# common/manifests/defines/module_file.pp -- use an already defined module_dir
# to store module specific files
#
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

# Usage:
# module_file { "module/file":
# 		source => "puppet://..",
# 		mode   => 644,   # default
# 		owner  => root,  # default
#		group  => root,  # default
# }
define module_file (
		$source,
		$mode = 0644, $owner = root, $group = 0
	)
{
	file {
		"${module_dir_path}/${name}":
			source => $source,
			mode => $mode, owner => $owner, group => $group;
	}
}
