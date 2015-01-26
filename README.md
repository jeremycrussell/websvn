# websvn
A puppet module for websvn

Assumes apache is managed on the node using puppetlabs-apache...

Needs a lot of work

Example:
class { 'websvn': 
  localrepo { 
    'repo1' => "file:///path/to/repo1"
  }
  remoterepo {
    'repo2' => "svn://server/repo2"
  }
}
