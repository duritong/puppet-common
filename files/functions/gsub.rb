# generic gsub call
module Puppet::Parser::Functions
	newfunction(:gsub, :type => :rvalue) do |args|
		args[0].gsub(/#{args[1]}/, args[2])
	end
end

