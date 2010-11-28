guard 'coffeescript', :output => 'js' do
  watch('^coffee/app/(.*)\.coffee')
end

guard 'coffeescript', :output => 'public/js' do
  watch('^coffee/public/(.*)\.coffee')
end

guard 'shell' do
  watch('^coffee/public/(.*)') {|m|
		`mkdir -p public/`
    filename=m[0].split('coffee/public/')[1]
		unless filename.split('.').pop=='coffee'
			tmp=filename.split('/')
			tmp.pop
			target_dir=tmp.join('/')
			unless target_dir.empty?
				puts "mkdir -p #{'public/' + target_dir}"
				`mkdir -p #{'public/' + target_dir}`
			end
			puts "cp #{m[0]} public/#{filename}"
			`cp #{m[0]} public/#{filename}`			
		end
	}
end

guard 'shell' do
  watch('^coffee/app/views/(.*)') {|m|
		`mkdir -p js/views/`
    filename=m[0].split('coffee/app/views/')[1]
		unless filename.split('.').pop=='coffee'
			tmp=filename.split('/')
			tmp.pop
			target_dir=tmp.join('/')
			unless target_dir.empty?
				puts "mkdir -p #{'js/views/' + target_dir}"
				`mkdir -p #{'js/views/' + target_dir}`
			end
			puts "cp #{m[0]} js/views/#{filename}"
			`cp #{m[0]} js/views/#{filename}`			
		end
	}
end