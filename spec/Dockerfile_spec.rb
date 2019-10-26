require 'spec_helper'

describe 'Dockerfile' do
    before(:all) do
        image = Docker::Image.build_from_dir('.')
        set :backend, :docker
        set :docker_image, image.id
        image
    end

    describe 'entrypoint' do
        it 'has apache2 running' do
            entrypoint do
                expect(process('apache2')).to be_running
            end
        end

        it 'has default settings file' do
            entrypoint do
                expect(file('/var/www/html/sites/default/default.settings.php')).to be_exist
            end
        end

        def entrypoint
            command('/bin/bash entrypoint.sh')
        end
    end
end
