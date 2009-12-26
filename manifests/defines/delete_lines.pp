define delete_lines($file, $pattern) {
   exec { "/bin/sed -i -r -e '/$pattern/d' $file":
      onlyif => "/bin/grep -E '$pattern' '$file'",
   }
}
