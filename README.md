# binding-site-definition
Macro files in combination with a shell script to employ YASARA-Model (or above)  for defining binding sites and residues in further molecular docking simulations. Level: Not for users with basic knowledge of shell scripting. More advanced knowledge will be beneficial.

<p> The files in this repository use the ability of YANACONDA Macro (https://www.yasara.org/yanaconda.htm) to substitute the splitpdb mode in SPORES (https://pubmed.ncbi.nlm.nih.gov/19453150/; https://pubmed.ncbi.nlm.nih.gov/20882397/) and the bind mode in PLANTS docking software (https://pubmed.ncbi.nlm.nih.gov/19125657/). The software SPORES and PLANTS are no longer available on the official Universität Konstanz website. </p>

<p>We have developed macros files to replace the modules since we can access YASARA-Structure. In October 2023, YASARA Biosciences GmbH made YASARA-Model freely available for academic users, at least until January 2026 (https://www.yasara.org/modeldl.htm). YASARA-Model could make use of our in-house developed macro files. Thus, here they are; we make the macros and the shell scripts embedded with the macro files publicly available. </p>

<p>The scripts start using the macro splitpdb.mcr to abstract the ligand from the protein binding pocket. Since some docking software, e.g., AutoDock Vina, require binding pocket definition to run the simulation, we provide the bind-res-definition.sh script that incorporates the defbindres.mcr to identify the center coordinate and the radius of the ligand in angstrom. The script also includes information about the list of residue numbers and names of the binding pockets, which can be used in a configuration file to run PyPLIF HIPPOS (https://pubs.acs.org/doi/10.1021/acs.jcim.0c00305).</p>
<p></p>
<p></p>
<p>Example of usage (for example the yasara app is located in the ~/yasara-model directory):</p>
<p>1. Create a new directory dpp4-alo in the home directory, and copy all the files from this repo to this new directory.</p>
<p>2. Download the 3G0B.pdb from https://www.rcsb.org/structure/3g0b</p>
<p>3. Abstract the chain A using grep: grep " A " 3G0B.pdb > 3G0B-chA.pdb
<p>4. Since the ligand has residue name of T22, run the following line: ~/yasara-model/yasara -txt "./splitpdb.mcr" "MacroTarget='3G0B-chA'" "LigName='T22'"
<p>The line resulted in the following files: 3G0B-chA-rec.pdb (the receptor/protein file) and 3G0B-chA-lig.pdb (the ligand file) </p>
<p> 5. Change the bind-res-definition.sh to executable, and run the following line: ./bind-res-definition.sh 3G0B-chA 5 </p>
<p> The line created 4 files:</p>
<p> (i)   3G0B-chA-center.txt: Containing the coordinate center of the reference ligand.</p>
<p> (ii)  3G0B-chA-radius.txt: Containing the ligand sphere's radius from the reference ligand's coordinate center. We can add 5 angstroms to this radius value to define the binding pocket.</p>
<p> (iii) 3G0B-chA-defbindres.txt: Containing the residues in the binding pocket, defined by 5 angstroms from the outer sphere of the ligand.</p>
<p> (iv)  3G0B-chA-bindres-num-name.lst: Containing information that can help to create configuration file for running PyPLIF HIPPOS.</p>



