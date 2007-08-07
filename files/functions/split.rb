# generic split call
module Puppet::Parser::Functions
	newfunction(:split, :type => :rvalue) do |args|
		args[0].split(/#{args[1]}/)
	end
end

