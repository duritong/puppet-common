Puppet::Parser::Functions::newfunction(
  :hash_merge,
  :type => :rvalue,
  :doc => "Merges two hashes

    Example: hash_merge({'a' => 1 ,'b' => 2},{'b' => 3, 'c' => 4}) -> {'a' => 1 ,'b' => 3, 'c' => 4}"
) do |args|
  raise Puppet::ParseError, 'hash_merge() needs two arguments' if args.length != 2
  args[0].merge(args[1])
end
