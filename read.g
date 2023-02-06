# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Reading the implementation part of the package.
#

ReadPackage( "CategoryConstructor", "gap/CategoryConstructor.gi");
ReadPackage( "CategoryConstructor", "gap/Tools.gi");
ReadPackage( "CategoryConstructor", "gap/ToolsMethodRecord.gi");
ReadPackage( "CategoryConstructor", "gap/ToolsDerivedMethods.gi");

## Homomorphism structure from closed structure
ReadPackage( "CategoryConstructor", "gap/HomomorphismStructureMethodRecord.gi" );
ReadPackage( "CategoryConstructor", "gap/HomomorphismStructureDerivedMethods.gi" );

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "CategoryConstructor", "gap/Julia.gi" );
fi;
