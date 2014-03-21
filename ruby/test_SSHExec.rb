require 'test/unit'
require 'net/ssh'

class TestSSHExecute < Test::Unit::TestCase

  REMOTEHOST = '10.11.1.101'
  REMOTEUSER = 'vagrant'
  REMOTEPWD = 'vagrant'

  def test_dummy_that_should_always_pass
    assert_equal(0, 0)
  end

  def test_transactional_session_with_password
    Net::SSH.start( REMOTEHOST, REMOTEUSER, :password => REMOTEPWD) do |session|
      result = session.exec!('ls -a .bashrc')
      assert_equal(".bashrc\n", result)
    end
  end

  def test_transactional_session_with_keys
    Net::SSH.start( REMOTEHOST, REMOTEUSER) do |session|
      result = session.exec!('ls -a .bashrc')
      assert_equal(".bashrc\n", result)
    end
  end
  
  def test_simple_session_with_password
    session = Net::SSH.start( REMOTEHOST, REMOTEUSER, :password => REMOTEPWD)
    result = session.exec!('ls -a .bashrc')
    assert_equal(".bashrc\n", result)
    session.close
  end

end

