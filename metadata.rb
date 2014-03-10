name             'giraffe'
maintainer       'Heavy Water Software Inc.'
maintainer_email 'ops@hw-ops.com'
license          'Apache 2.0'
description      'Manages Giraffe, a Graphite dashboard with a long neck'
version          '0.1.0'

%w(ubuntu centos).each do |os|
  supports os
end

depends 'git'
