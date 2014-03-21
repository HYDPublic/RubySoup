require 'test/unit'
require 'net/scp' # secure copy

#require 'uri/open-scp'

class Test_SCP < Test::Unit::TestCase

  REMOTEHOST = '10.11.1.101'
  REMOTEUSER = 'vagrant'
  REMOTEFILE1 = '/vagrant/fileFromRemoteVagrant.txt'
  REMOTEFILE2 = 'filefromRemoteHome.txt'
  LOCALDIR = '/tmp'

  # This is a dummy test that should ALWAYS pass
  def test_dummy
    assert_equal(0, 0)
  end

  def test_create_tstamp_file_in_local_dir
    tstamp = Time.now
    f = File.open(LOCALDIR + '/tstamp.txt', 'w') {|f| f.write(tstamp.inspect) }
    assert_equal(tstamp.inspect.length, f)
  end


  def test_stringio
    def foo_writer(file)
      file.write "foo"
    end
    s = StringIO.new
    foo_writer(s) 
    # raise "fail" unless s.string == "foo"
    assert_equal(s.string, "foo")
  end
  
  def test_persistent_connection_0
    # use a persistent connection to transfer files
    Net::SCP.start(REMOTEHOST, REMOTEUSER) do |scp|

      ## upload a file to a remote server
      #scp.upload! "/local/path", "/remote/path"

    end
    assert_equal(0, 0)
  end

  def test_persistent_connection_1_upload_in_memory
    Net::SCP.start(REMOTEHOST, REMOTEUSER) do |scp|
      # upload from an in-memory buffer
      scp.upload! StringIO.new(Time.now.inspect), REMOTEFILE1
      scp.upload! StringIO.new(Time.now.inspect), REMOTEFILE2
    end
    assert_equal(0, 0)
  end

  def test_persistent_connection_2_download_parallel
    # use a persistent connection to transfer files
    Net::SCP.start(REMOTEHOST, REMOTEUSER) do |scp|

      # run multiple downloads in parallel
      d1 = scp.download(REMOTEFILE1, LOCALDIR)
      d2 = scp.download(REMOTEFILE2, LOCALDIR)
      [d1, d2].each { |d| d.wait }

    end
    assert_equal(0, 0)
  end

end

  #  # upload (download) a file to a remote server
  #  def test_uploadCygdrivePath
  #    #Net::SCP.download!("remote.host.com", "username", "/remote/path", "/local/path", :ssh => { :password => "password" })
  #    u = Net::SCP.upload!("perfvm212", "wfcautouser", "tstamp.txt", "/cygdrive/c/dev", :ssh => { :password => "2omniqa!" })
  #    assert_equal(nil, u)
  #  end

  #  # upload (download) a file to a remote server
  #  def test_uploadDOSPath
  #    #Net::SCP.download!("remote.host.com", "username", "/remote/path", "/local/path", :ssh => { :password => "password" })
  #    u = Net::SCP.upload!(REMOTEHOST, REMOTEUSER, "tstamp.txt", "C:/dev") # , :ssh => { :password => "2omniqa!"})
  #    assert_equal(nil, u)
  #  end

  #  download a file to an in-memory buffer
  #
  #  data = nil
  #  Net::SCP.start("remote.host.com", "username", :password => "password") do |scp|
  #    data = scp.download!("/remote/path")
  #  end

  #  # download a file from a remote server
  #  def test_download
  #    Net::SCP.download!("remote.host.com", "username",
  #    "/remote/path", "/local/path",
  #    :ssh => { :password => "password" })
  #    assert_equal(0, 0)
  #  end
  #
  #  def test_downloadInMemory
  #    # download a file to an in-memory buffer
  #    data = Net::SCP::download!("remote.host.com", "username", "/remote/path")
  #    assert_equal("", data)
  #  end
  #
  #
  #  #  # You can also use open-uri to grab data via scp:
  #  #  def test_openUriGrabData
  #  #    f = open("scp://wfcautouser@perf271/path/to/file").read
  #  #    puts f
  #  #    assert_equal("", f)
  #  #  end

