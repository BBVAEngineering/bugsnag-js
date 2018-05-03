require 'json'
version = (JSON.parse open('package.json', &:read))['version']

unless ENV['MAZE_SKIP_INSTALL'] then
  run_required_commands([
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
else
  puts 'SKIPPING DEPENDENCY INSTALLATION'
end
