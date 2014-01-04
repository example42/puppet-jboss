require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'jboss::instance', :type => :define do
  let(:title) { 'app1' }
  let(:facts) {{ :operatingsystem => 'RedHat' }}

  describe 'parameter init_timeout' do
    context 'default' do
      let(:params) {{ :createuser => false }}

      it do
        should contain_file('Jboss_initscript_app1').
          with({
            'path'  => '/etc/init.d/jboss-app1',
            'mode'  => '0755',
            'owner' => 'root',
            'group' => 'root',
          }).
          with_content(/timeout=0/) 
      end
    end

    context '=> 42' do
      let(:params) {{ :createuser => false, :init_timeout => 42 }}

      it do
        should contain_file('Jboss_initscript_app1').
          with({
            'path' => '/etc/init.d/jboss-app1',
            'mode' => '0755',
            'owner' => 'root',
            'group' => 'root',
          }).
          with_content(/timeout=42/) 
      end
    end
  end
end
