default['jre']['install_dir'] = '/tmp'
default['jre']['version'] = '1.8.0'
default['jre']['download_url'] = 'http://javadl.oracle.com/webapps/download/AutoDL?BundleId=225344_090f390dda5b47b9b721c7dfaa008135'
default['jre']['filename'] = 'jre-8u144-linux-x64.rpm'
default['postgres']['install_dir'] = '/tmp'
default['postgres']['version'] = '9.4'
default['postgres']['download_url'] = 'https://download.postgresql.org/pub/repos/yum/9.4/redhat/rhel-6-x86_64/pgdg-redhat94-9.4-3.noarch.rpm'
default['postgres']['package'] = 'postgresql94-server'
node.default['splunk']['conf']['comm_secrets'] =
  {
    'init_pwd' => {
      'getkey' => 'y7.splunk.init_pwd',
      'value' => '',
    },
    'splunk_secret' => {
      'getkey' => 'y7.splunk.splunk_secret',
      'value' => '',
    },
  }
