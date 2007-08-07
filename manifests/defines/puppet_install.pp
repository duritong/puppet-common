# puppet_install.pp -- install puppet functions and facter facts
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

define puppet::function($source) {
	file {
		"${rubysitedir}/puppet/parser/functions/${name}.rb":
			source => $source,
			mode => 755, owner => root, group => root,
	}
}

define puppet::fact($source) {
	file {
		"${rubysitedir}/facter/${name}.rb":
			source => $source,
			mode => 755, owner => root, group => root,
	}
}
