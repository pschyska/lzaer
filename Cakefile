# TODO:
# - try to get output :-)
# - possibly try to concatenate static client (.coffee-)scripts
# - think about how to share public between dist and build (symlinks to js files should be different)

{exec} = require 'child_process'
fs     = require 'fs'


task 'build', 'Build project from src/*.coffee to build/*.js', ->
  exec 'coffee -l --compile --output build/ src/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'optimize', 'DYSFUNCTIONAL: Compile js files with google closure compiler from build/*.js to dist/*.js', ->
  optimizeDir = (dir, files) ->
    console.log 'DIR: '+dir
    for file in files
      console.log 'FILE: '+file
      fs.stat file, (err, stats) ->
        if stats and stats.isDirectory()
          optimizeDir dir+file, fs.readdirSync file
        else if file.match(/\.js$/)
          exec "mkdir -p dist/#{dir}"
          exec "closure --compilation_level ADVANCED_OPTIMIZATONS --js build/#{dir+'/'+file} --js_output_file dist/#{dir+'/'+file}", (err, stdout, stderr) ->
            throw err if err
            console.log stdout + stderr
  optimizeDir '', fs.readdirSync 'build'

task 'start', 'run build/server.js', ->
  exec 'node build/server.js', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'start:production', 'DYSFUNCTIONAL: run dist/server.js', ->
  exec 'node dist/server.js', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'run', 'build, then start', ->
  exec 'cake build'
  exec 'cake start'

task 'supervise', 'run and reload on modification of src/ or public/', ->
  exec 'cake run'
  exec 'supervisor -p "cake run" -w "src, public"'