# common/manifests/defines/config_file.pp -- put a config file with default permissions
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

# Usage:
# config_file { filename:
# 	content => "....\n",
# }
define config_file ($content) {
	file { $name:
		content => $content, backup => server,
		mode => 0644, owner => root, group => root,
	}
}


