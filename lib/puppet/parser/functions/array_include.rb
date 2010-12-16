Puppet::Parser::Functions::newfunction(
  :array_include,
  :type => :rvalue,
  :doc => "Checks whether an item is included or not

    Example: array_include(['a','b'],'b') -> true
    Example: array_include(['a','b'],'c') -> false"
) do |args|
  raise Puppet::ParseError, 'array_include() needs two arguments' if args.length != 2
  args[0].include?(args[1])
end
