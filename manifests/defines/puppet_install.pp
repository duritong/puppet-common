# puppet_install.pp -- install puppet functions and facter facts
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

# prepare directories to drop various puppet enhancements
file {
	[
		"${rubysitedir}",
		"${rubysitedir}/facter",
		"${rubysitedir}/puppet",
		"${rubysitedir}/puppet/provider",
		"${rubysitedir}/puppet/provider/user",
		"${rubysitedir}/puppet/provider/group"
	]:
		ensure => directory,
		mode => 0755, owner => root, group => root,
}

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

define puppet::provider($source) {
	file {
		"${rubysitedir}/puppet/provider/${name}.rb":
			source => $source,
			mode => 755, owner => root, group => root,
	}
}
