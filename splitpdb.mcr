LoadPDB (MacroTarget).pdb,Center=No,Correct=No,Transfer=No 
DelRes !AminoAcid
pH value=7.4,update=Yes
CleanAll
SavePDB 1,(MacroTarget)-rec.pdb,Format=PDB,Transform=No,UseCIF=No
Clear
LoadPDB (MacroTarget).pdb,Center=No,Correct=No,Transfer=No
DelRes !(LigName)
pH value=7.4,update=Yes
CleanAll
SavePDB 1,(MacroTarget)-lig.pdb,Format=PDB,Transform=No,UseCIF=No
Clear
Exit

