require 'ftools'
require 'fileutils'

task :default => :install
desc "Copy the gdbinit files to your home directory"
task :install do

    gdb_dir = File.expand_path("~/.gdb/")
    gdbinit_dir = File.dirname(__FILE__)


    # Make sure the main directory exists
    FileUtils.mkdir_p "#{gdb_dir}" if !File.exists? "#{gdb_dir}"
    ln "#{gdbinit_dir}/gdbinit", "#{File.expand_path("~/.gdbinit")}"

    # Add the subdirectories
    Dir['**/'].each do |d|
        FileUtils.mkdir_p "#{gdb_dir}/#{d}"
    end

    Dir["**/*.{gdbinit}"].each do |f|
        ln "#{gdbinit_dir}/#{f}", "#{gdb_dir}/#{f}"
    end

end

task :uninstall do
    gdb_dir = File.expand_path("~/.gdb/")

    # Remove the default init
    safe_rm "#{File.expand_path("~/.gdbinit")}"

    Dir["**/*.{gdbinit}"].each do |f|
        safe_rm "#{gdb_dir}/#{f}"
    end

end

def ln(src, dst)
     begin
          FileUtils.ln_s src, dst
          puts "Symlink #{File.basename src}\t => #{File.basename dst}"
     rescue Errno::EEXIST
          puts "#{File.basename dst} exists! Skipping."
     end
end

def safe_rm(target)
     if FileTest.exists? target and FileTest.symlink? target
          puts "#{File.basename target} removed."
          File.delete target
     else
          puts "#{File.basename target} is not a symlink. Skipping"
     end
end
