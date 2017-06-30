require 'fukafuka'
require 'revision_plate'

map '/hello/revision' do
  run RevisionPlate::App.new(File.join(__dir__, 'REVISION'))
end

run Fukafuka.app
