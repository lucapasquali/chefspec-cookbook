require 'yahoo/cookbook_version_helper'

name 'pdi-base-cookbook'
maintainer 'au-se-team'
maintainer_email 'au-se-team@yahoo-inc.com'
license 'Copyright 2017 Yahoo Inc. All rights reserved.'
description 'installation for pdi base packages'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
supports 'redhat'
chef_version '>=12.15.19' if respond_to?(:chef_version)
version Yahoo::CookbookVersionHelper.cookbook_version

source_url 'https://git.corp.yahoo.com/lucap/pdi-base-cookbook'
issues_url 'https://git.corp.yahoo.com/lucap/pdi-base-cookbook/issues'
