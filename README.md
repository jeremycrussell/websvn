# websvn
A puppet module for websvn

Depends on te Puppetlabs apache module.

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
