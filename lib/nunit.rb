require 'rake'
require 'rake/tasklib'

module Rake

  class NUnitTask < Rake::TaskLib
    attr_accessor :assemblies, :xml, :path_to_console, :config, :exclude, :include

    # Create an NUnit task named nunit.
    def initialize()
		yield self if block_given?
		define
    end
    
    # Create the tasks defined by this task lib.
    def define
		task :nunit do
			sh "#{@path_to_console} #{@include} #{exclude} #{xml} #{config} #{assemblies}"
		end
		self
    end

    def xml
		"/xml:#{@xml}" if @xml
    end
    
    def config
		"/config:#{@config}" if @config
    end
	
	def exclude
		"/exclude:#{@exclude}" if @exclude
	end
		
	def include
		"/include:#{@include}" if @include
	end
  end
end