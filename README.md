# [A sibling study of variation in parental mutation rates](https://www.biorxiv.org/content/10.64898/2026.05.10.724105v1)

## aou

This directory includes all Jupyter notebooks used to run analyses on the All of Us Researcher Workbench (access required)
The notebooks are numbered in the order they are run. The overall flow is aou/ 1-21, then pca/ 1-6, then aou/ 22-30.

| Notebook | Description |
| --- | --- |
| 1_methods_relatedness_python | download array data and subset it to related individuals |
| 2_methods_relatedness_R | identify parent-offspring pairs, siblings, trios, twins, and quads |
| 3_call_ibd2_using_snipar_python | call IBD2 segments using snipar |
| 4_analyze_snipar_out_R | combine IBD calls across chromosomes |
| 5_subset_vds_python | subset the AoU VDS to a Hail MT |
| 6_find_differences_twins_python | call differences between twins |
| 7_analyze_differences_twins_R | merge twin difference files and identify error-prone GIAB difficult regions |
| 8_analyze_twin_spectra_python | analyze twin/duplicate spectra before and after removing GIAB difficult regions |
| 9_find_differences_trios_python | call DNMs in trios |
| 10_find_differences_siblings_python | call DNMs in siblings |
| 11_trim_ibd2_python | trim IBD2 segments |
| 12_analyze_trio_quad_standard_QC_R | merge trio DNM calls after standard QC and GIAB filtering |
| 13_determine_quad_ibd2_filters_R | use quads to determine the IBD2 trim and minimum IBD2 length |
| 14_analyze_siblings_standard_QC_ibd2_R | merge sibling DNM calls, remove GIAB regions, and apply the IBD2 trim |
| 15_prepare_to_calculate_af_R | prepare the files needed for allele frequency calculation |
| 16_calculate_af_python | calculate allele frequencies for trio and sibling differences after removing first-degree relatives |
| 17_determine_af_and_cluster_filter_using_quads_R | determine distance and AF filters from quads, apply them to sibling differences, remove outlier siblings, and write final counts |
| 18_annotate_trio_sibling_dnm_COSMIC_python | annotate all trio and sibling DNMs with their mutation types |
| 19_distribution_genome_figure_files_R | prepare files for plotting the distribution of sibling DNMs across the genome |
| 20_distribution_genome_figure_files_python | prepare additional files (testis methylation, LCL replication timing) for the genome distribution plots |
| 21_distribution_genome_figure_R | generate the genome-wide heatmap of sibling differences in 1 Mb windows, C>A rate by replication timing, CpG>TpG rate by methylation, and UKB/AoU sibling pair DNM-count histograms |
| 22_remove_giab_from_ibd2_python | remove GIAB regions from the trimmed, quality-controlled IBD2 segments |
| 23_generate_family_files_R | generate 96-type phenotype files at the individual and family levels |
| 24_missense_lof_python | identify missense and LoF variants in DNA repair genes and find non-reference genotypes in trio parents and sibling pairs |
| 25_missense_lof_R | generate genotype tables for the burden test |
| 26_methods_ancestry_R | generate ancestry clusters and compare DNM counts and spectra across ancestries |
| 27_methods_smoking_R | compare mutation rates across parental smoking status and generate files for smoking spectrum inference |
| 28_methods_smoking_python | test whether mutations from smoking parents include smoking-associated SBS |
| 29_rev1_lig1_sibling_compare_R | generate files to test whether the sibling carrying the disruptive REV1 or LIG1 mutation has a higher mutation rate (clonal hematopoiesis vs germline) |
| 30_rev1_lig1_replication_cpg_R | test for a REV1-replication timing relationship and a LIG1-methylation relationship |

## pca

This directory includes all Jupyter notebooks used to run PCA on the 3400 HGDP-1000 genome samples and project UKB and AoU samples. Analyses were run on the AoU Researcher Workbench and UK Biobank Research Analysis Platform (access required).

| Notebook | Description |
| --- | --- |
| 1_curate_pca_variants_python | curate PCA variants that pass filters across UKB, AoU, and HGDP+1KG |
| 2_generate_hgdp_1kg_pcs_python | run PCA on HGDP + 1KG |
| 3_project_aou_python | project AoU samples onto HGDP+1KG PC-space |
| 4_make_loadings_ukb_style_R | modify the PCA variants so they match the UKB ref/alt configuration |
| 5_project_ukb_python | project UKB samples onto the HGDP+1KG PC-space (run on the UKB RAP) |
| 6_analyze_pca_R | merge and clean PCs from HGDP+1KG, UKB, and AoU |

## data 

This directory includes useful files. 

| File | Description |
| --- | --- |
| giab_difficult_merged.bed.gz | bed file including error-prone regions in the UKB and AoU (hg38)|
