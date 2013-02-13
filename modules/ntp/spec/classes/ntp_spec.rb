require 'spec_helper'

describe 'ntp', :type => 'class' do
  include_context 'hieradata'
  context 'no parameters' do
    let(:params) { {} }
    it {
      should create_class('ntp::config').with( {
        'servers' => [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org' ],
        'iburst'  => false,
      } )
    }
    it {
      should contain_file('/etc/ntp.conf').with( {
        'ensure'  => 'present',
        'mode'    => '0444',
      } )
    }
    it 'server entries' do
      content = catalogue.resource('file', '/etc/ntp.conf').send(:parameters)[:content]
      content.should match('^server 0.pool.ntp.org$')
      content.should match('^server 1.pool.ntp.org$')
      content.should match('^server 2.pool.ntp.org$')
    end
  end
  context 'servers parameter' do
    let(:params) { { :servers => [ 'ntp1.example.com', 'ntp2.example.com' ] } }
    it {
      should create_class('ntp::config').with( {
        'servers' => [ 'ntp1.example.com', 'ntp2.example.com' ],
        'iburst'  => false,
      } )
    }
    it {
      should contain_file('/etc/ntp.conf').with( {
        'ensure'  => 'present',
        'mode'    => '0444',
      } )
    }
    it 'server entries' do
      content = catalogue.resource('file', '/etc/ntp.conf').send(:parameters)[:content]
      content.should match('^server ntp1.example.com$')
      content.should match('^server ntp2.example.com$')
    end
  end
  context 'country parameter' do
    let(:params) { { :country => 'uk' } }
    it {
      should create_class('ntp::config').with( {
        'servers' => [ '0.uk.pool.ntp.org', '1.uk.pool.ntp.org', '2.uk.pool.ntp.org' ],
      } )
    }
    it {
      should contain_file('/etc/ntp.conf').with( {
        'ensure'  => 'present',
        'mode'    => '0444',
      } )
    }
    it 'server entries' do
      content = catalogue.resource('file', '/etc/ntp.conf').send(:parameters)[:content]
      content.should match('^server 0.uk.pool.ntp.org$')
      content.should match('^server 1.uk.pool.ntp.org$')
      content.should match('^server 2.uk.pool.ntp.org$')
    end
  end
  context 'continent parameter' do
    let(:params) { { :continent => 'asia' } }
    it {
      should create_class('ntp::config').with( {
        'servers' => [ '0.asia.pool.ntp.org', '1.asia.pool.ntp.org', '2.asia.pool.ntp.org' ],
      } )
    }
    it {
      should contain_file('/etc/ntp.conf').with( {
        'ensure'  => 'present',
        'mode'    => '0444',
      } )
    }
    it 'server entries' do
      content = catalogue.resource('file', '/etc/ntp.conf').send(:parameters)[:content]
      content.should match('^server 0.asia.pool.ntp.org$')
      content.should match('^server 1.asia.pool.ntp.org$')
      content.should match('^server 2.asia.pool.ntp.org$')
    end
  end
  context 'servers takes precendence over country and continent' do
    let(:params) { { :servers => [ 'ntp1.example.com' ], :country => 'za', :continent => 'asia' } }
    it {
      should create_class('ntp::config').with( {
        'servers' => [ 'ntp1.example.com' ],
      } )
    }
    it {
      should contain_file('/etc/ntp.conf').with( {
        'ensure'  => 'present',
        'mode'    => '0444',
      } )
    }
    it 'server entries' do
      content = catalogue.resource('file', '/etc/ntp.conf').send(:parameters)[:content]
      content.should match('^server ntp1.example.com$')
    end
  end
  context 'servers unset; country takes precendence over continent' do
    let(:params) { { :country => 'za', :continent => 'asia' } }
    it {
      should create_class('ntp::config').with( {
        'servers' => [ '0.za.pool.ntp.org', '1.za.pool.ntp.org', '2.za.pool.ntp.org' ],
      } )
    }
    it {
      should contain_file('/etc/ntp.conf').with( {
        'ensure'  => 'present',
        'mode'    => '0444',
      } )
    }
    it 'server entries' do
      content = catalogue.resource('file', '/etc/ntp.conf').send(:parameters)[:content]
      content.should match('^server 0.za.pool.ntp.org$')
      content.should match('^server 1.za.pool.ntp.org$')
      content.should match('^server 2.za.pool.ntp.org$')
    end
  end
  context 'iburst parameter true' do
    let(:params) { { 
      :servers => [ 'ntp1.example.com', 'ntp2.example.com' ],
      :iburst  => true,
    } }
    it {
      should create_class('ntp::config').with( {
        'servers' => [ 'ntp1.example.com', 'ntp2.example.com' ],
        'iburst'  => true,
      } )
    }
    it {
      should contain_file('/etc/ntp.conf').with( {
        'ensure'  => 'present',
        'mode'    => '0444',
      } )
    }
    it 'server entries have an iburst parameter' do
      content = catalogue.resource('file', '/etc/ntp.conf').send(:parameters)[:content]
      content.should match('^server ntp1.example.com iburst$')
      content.should match('^server ntp2.example.com iburst$')
    end
  end
end
