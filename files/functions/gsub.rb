# generic gsub call
module Puppet::Parser::Functions
	newfunction(:gsub, :type => :rvalue) do |args|
		if args[0].is_a?(Array)
			args[0].collect do |val|
				val.gsub(/#{args[1]}/, args[2])
			end
		else
			args[0].gsub(/#{args[1]}/, args[2])
		end
	end
end

