require 'json'
version = (JSON.parse open('package.json', &:read))['version']

run_required_commands([
  # install rubygems
  ['bundle', 'install', '--verbose'],
  # package up local bugsnag-js so it can be installed in the fixtures
  ['npm', 'pack', '--verbose'],
])

# install node_modules
Dir.chdir('features/fixtures') do
  run_required_commands([
    ['npm', 'install', '--no-package-lock', '--verbose'],
    [
      'npm',
      'install',
      '--no-package-lock',
      '--no-save',
      '--verbose',
      "../../bugsnag-js-#{version}.tgz",
    ],
  ])
end
