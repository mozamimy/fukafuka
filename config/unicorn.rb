working_directory '/app'

timeout (ENV['UNICORN_TIMEOUT'] || 30).to_i

if ENV['LISTEN_UNIX']
  listen ENV['LISTEN_UNIX'], backlog: 2048
else
  listen (ENV['PORT'] || 8080).to_i
end

preload_app true

worker_processes (ENV['WORKER_NUM'] || 8).to_i

pid_path = '/tmp/unicorn.pid'
pid pid_path
if ENV['UNICORN_LOG_TO_STDOUT'] == '1'
  stdout_path '/dev/stdout'
  stderr_path '/dev/stderr'
else
  stderr_path '/log/unicorn-err.log'
  stdout_path '/log/unicorn-out.log'
end
