# Makefile.PL for a package defined by PP code.

use PDL::Core::Dev;            # Pick up development utilities
use ExtUtils::MakeMaker;

$netcdf_lib_path     = '/opt/local/lib';
$netcdf_include_path = '/opt/local/include';

$package = ["netcdfobj.pd",NetCDFobj,PDL::NetCDFobj];
WriteMakefile(
	      'NAME'  	     => 'PDL::NetCDFobj',
	      'VERSION_FROM' => 'netcdfobj.pd',
	      'TYPEMAPS'     => [&PDL_TYPEMAP()], 
	      'OBJECT'       => 'NetCDFobj.o ',
	      'PM'           => { 'NetCDFobj.pm' => '$(INST_LIBDIR)/NetCDFobj.pm'},
	      'INC'          => &PDL_INCLUDE()." -I$netcdf_include_path", 
	      'LIBS'         => ["-lnetcdf -L$netcdf_lib_path"],  
	      'clean'        => {'FILES'  => 
				   'NetCDFobj.pm NetCDFobj.xs NetCDFobj.o NetCDFobj.c'},
	      'dist'         => { COMPRESS => 'gzip', SUFFIX => 'gz' },	
	      );

sub MY::postamble { pdlpp_postamble($package); }	
