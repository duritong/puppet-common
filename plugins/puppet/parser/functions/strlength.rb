module Puppet::Parser::Functions
    newfunction(:strlength, :type => :rvalue) do |args|
       argv[0].to_s.length 
    end
end

