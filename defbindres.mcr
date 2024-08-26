LoadPDB (MacroTarget)-rec.pdb,Center=No,Correct=No,Transfer=No 
LoadPDB (MacroTarget)-lig.pdb,Center=No,Correct=No,Transfer=No 
LogAs (MacroTarget)-center.txt
GroupCenter Obj 2, Type = Geometric
LogAs (MacroTarget)-radius.txt
RadiusObj 2
LogAs (MacroTarget)-defbindres.txt
ListRes Protein with distance < (radius) from Obj 2
Exit
