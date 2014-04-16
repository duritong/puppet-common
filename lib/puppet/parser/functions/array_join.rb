Puppet::Parser::Functions::newfunction(:array_join,
    :type => :rvalue,
    :doc  => "Join a list of strings with an optional delimiter.") do |args|
  unless 1..2.include? args.length
    raise Puppet::ParseError, 'array_join() takes 1 or 2 arguments'
  end
  args.first.join args.last
end
