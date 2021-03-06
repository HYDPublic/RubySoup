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

