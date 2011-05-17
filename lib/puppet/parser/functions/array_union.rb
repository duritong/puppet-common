Puppet::Parser::Functions::newfunction(
  :array_union,
  :type => :rvalue,
  :doc => "Unions two arrays

    Example: array_union(['a','b'],['c']) -> ['a','b','c']"
) do |args|
  raise Puppet::ParseError, 'array_union() needs two arguments' if args.length != 2
  args[0].to_a | args[1].to_a
end
