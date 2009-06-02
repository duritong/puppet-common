<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
<!-- git web interface version 1.5.6.5, (C) 2005-2006, Kay Sievers <kay.sievers@vrfy.org>, Christian Gierke -->
<!-- git core binaries version 1.5.6.5 -->
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<meta name="generator" content="gitweb/1.5.6.5 git/1.5.6.5"/>
<meta name="robots" content="index, nofollow"/>
<title>git.black.co.at Git - module-common/blob - plugins/puppet/parser/functions/gsub.rb</title>
<link rel="stylesheet" type="text/css" href="/gitweb.css"/>
<link rel="alternate" title="module-common - history of plugins/puppet/parser/functions/gsub.rb - RSS feed" href="/?p=module-common;a=rss;f=plugins/puppet/parser/functions/gsub.rb" type="application/rss+xml" />
<link rel="alternate" title="module-common - history of plugins/puppet/parser/functions/gsub.rb - RSS feed (no merges)" href="/?p=module-common;a=rss;f=plugins/puppet/parser/functions/gsub.rb;opt=--no-merges" type="application/rss+xml" />
<link rel="alternate" title="module-common - history of plugins/puppet/parser/functions/gsub.rb - Atom feed" href="/?p=module-common;a=atom;f=plugins/puppet/parser/functions/gsub.rb;opt=--no-merges" type="application/atom+xml" />
<link rel="alternate" title="module-common - history of plugins/puppet/parser/functions/gsub.rb - Atom feed (no merges)" href="/?p=module-common;a=atom;f=plugins/puppet/parser/functions/gsub.rb;opt=--no-merges" type="application/atom+xml" />
<link rel="shortcut icon" href="/git-favicon.png" type="image/png" />
</head>
<body>
<div class="page_header">
<a title="git homepage" href="http://git.or.cz/"><img src="/git-logo.png" width="72" height="27" alt="git" class="logo"/></a><a href="/">projects</a> / <a href="/?p=module-common;a=summary">module-common</a> / blob
</div>
<form method="get" action="/" enctype="application/x-www-form-urlencoded">
<div class="search">
<input name="p" type="hidden" value="module-common" />
<input name="a" type="hidden" value="search" />
<input name="h" type="hidden" value="9a2c68367f8ac75ce52e315253d28f6710a80702" />
<select name="st" >
<option selected="selected" value="commit">commit</option>
<option value="grep">grep</option>
<option value="author">author</option>
<option value="committer">committer</option>
<option value="pickaxe">pickaxe</option>
</select><sup><a href="/?p=module-common;a=search_help">?</a></sup> search:
<input type="text" name="s"  />
<span title="Extended regular expression"><label><input type="checkbox" name="sr" value="1" />re</label></span></div>
</form>
<div class="page_nav">
<a href="/?p=module-common;a=summary">summary</a> | <a href="/?p=module-common;a=shortlog">shortlog</a> | <a href="/?p=module-common;a=log">log</a> | <a href="/?p=module-common;a=commit;h=9a2c68367f8ac75ce52e315253d28f6710a80702">commit</a> | <a href="/?p=module-common;a=commitdiff;h=9a2c68367f8ac75ce52e315253d28f6710a80702">commitdiff</a> | <a href="/?p=module-common;a=tree;h=1c3878edc7c869f1a8861389d6d24de8cab3ae2a;hb=9a2c68367f8ac75ce52e315253d28f6710a80702">tree</a><br/>
<a href="/?p=module-common;a=history;f=plugins/puppet/parser/functions/gsub.rb;h=e2410ffbadf6e7a93fbf7960540048f58fa96c9b;hb=9a2c68367f8ac75ce52e315253d28f6710a80702">history</a> | <a href="/?p=module-common;a=blob_plain;f=plugins/puppet/parser/functions/gsub.rb;h=e2410ffbadf6e7a93fbf7960540048f58fa96c9b;hb=9a2c68367f8ac75ce52e315253d28f6710a80702">raw</a> | <a href="/?p=module-common;a=blob;f=plugins/puppet/parser/functions/gsub.rb;hb=HEAD">HEAD</a><br/>
</div>
<div class="header">
<a class="title" href="/?p=module-common;a=commit;h=9a2c68367f8ac75ce52e315253d28f6710a80702">create a common class to install openssl</a>
</div>
<div class="page_path"><a title="tree root" href="/?p=module-common;a=tree;hb=9a2c68367f8ac75ce52e315253d28f6710a80702">[module-common]</a> / <a title="plugins" href="/?p=module-common;a=tree;f=plugins;hb=9a2c68367f8ac75ce52e315253d28f6710a80702">plugins</a> / <a title="plugins/puppet" href="/?p=module-common;a=tree;f=plugins/puppet;hb=9a2c68367f8ac75ce52e315253d28f6710a80702">puppet</a> / <a title="plugins/puppet/parser" href="/?p=module-common;a=tree;f=plugins/puppet/parser;hb=9a2c68367f8ac75ce52e315253d28f6710a80702">parser</a> / <a title="plugins/puppet/parser/functions" href="/?p=module-common;a=tree;f=plugins/puppet/parser/functions;hb=9a2c68367f8ac75ce52e315253d28f6710a80702">functions</a> / <a title="plugins/puppet/parser/functions/gsub.rb" href="/?p=module-common;a=blob_plain;f=plugins/puppet/parser/functions/gsub.rb;hb=9a2c68367f8ac75ce52e315253d28f6710a80702">gsub.rb</a><br/></div>
<div class="page_body">
<div class="pre"><a id="l1" href="#l1" class="linenr">   1</a> module&nbsp;Puppet::Parser::Functions</div>
<div class="pre"><a id="l2" href="#l2" class="linenr">   2</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;thin&nbsp;wrapper&nbsp;around&nbsp;the&nbsp;ruby&nbsp;gsub&nbsp;function</div>
<div class="pre"><a id="l3" href="#l3" class="linenr">   3</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;gsub($string,&nbsp;$pattern,&nbsp;$replacement)&nbsp;will&nbsp;replace&nbsp;all&nbsp;occurrences&nbsp;of</div>
<div class="pre"><a id="l4" href="#l4" class="linenr">   4</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;$pattern&nbsp;in&nbsp;$string&nbsp;with&nbsp;$replacement.&nbsp;$string&nbsp;can&nbsp;be&nbsp;either&nbsp;a&nbsp;singel</div>
<div class="pre"><a id="l5" href="#l5" class="linenr">   5</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;value&nbsp;or&nbsp;an&nbsp;array.&nbsp;In&nbsp;the&nbsp;latter&nbsp;case,&nbsp;each&nbsp;element&nbsp;of&nbsp;the&nbsp;array&nbsp;will</div>
<div class="pre"><a id="l6" href="#l6" class="linenr">   6</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;be&nbsp;processed&nbsp;in&nbsp;turn.</div>
<div class="pre"><a id="l7" href="#l7" class="linenr">   7</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;newfunction(:gsub,&nbsp;:type&nbsp;=&gt;&nbsp;:rvalue)&nbsp;do&nbsp;|args|</div>
<div class="pre"><a id="l8" href="#l8" class="linenr">   8</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;args[0].is_a?(Array)</div>
<div class="pre"><a id="l9" href="#l9" class="linenr">   9</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;args[0].collect&nbsp;do&nbsp;|val|</div>
<div class="pre"><a id="l10" href="#l10" class="linenr">  10</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;val.gsub(/#{args[1]}/,&nbsp;args[2])</div>
<div class="pre"><a id="l11" href="#l11" class="linenr">  11</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;end</div>
<div class="pre"><a id="l12" href="#l12" class="linenr">  12</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else</div>
<div class="pre"><a id="l13" href="#l13" class="linenr">  13</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;args[0].gsub(/#{args[1]}/,&nbsp;args[2])</div>
<div class="pre"><a id="l14" href="#l14" class="linenr">  14</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;end</div>
<div class="pre"><a id="l15" href="#l15" class="linenr">  15</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;end</div>
<div class="pre"><a id="l16" href="#l16" class="linenr">  16</a> end</div>
<div class="pre"><a id="l17" href="#l17" class="linenr">  17</a> </div>
</div><div class="page_footer">
<div class="page_footer_text">generic defines, functions and other miscellanea</div>
<a class="rss_logo" title="history of plugins/puppet/parser/functions/gsub.rb RSS feed" href="/?p=module-common;a=rss;f=plugins/puppet/parser/functions/gsub.rb">RSS</a>
<a class="rss_logo" title="history of plugins/puppet/parser/functions/gsub.rb Atom feed" href="/?p=module-common;a=atom;f=plugins/puppet/parser/functions/gsub.rb">Atom</a>
</div>
</body>
</html>