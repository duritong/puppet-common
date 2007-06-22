# common/manifests/init.pp - Define common infrastructure for modules
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

# Module programmers can use /var/lib/puppet/modules/$modulename to 
# save module-local data, e.g. for constructing config files
file {
	"/var/lib/puppet/modules":
		ensure => directory,
		mode => 0755, owner => root, group => root;
}

