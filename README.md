# websvn
A puppet module for websvn

Depends on the Puppetlabs apache module.

Needs a lot of work, but tested on RHEL6.

Example:
class { 'websvn': 
  localrepo { 
    'repo1' => "file:///path/to/repo1"
  }
  remoterepo {
    'repo2' => "svn://server/repo2"
  }
}
