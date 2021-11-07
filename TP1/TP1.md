# TP1 - Bases de données et recherche par similarité de séquences [[AMU](https://www.univ-amu.fr/) / [S&H](https://formations.univ-amu.fr/ME3SHU.html) / [N&C3](https://formations.univ-amu.fr/ME3SHU-S11XX3M1.html)] 


<link href="../tp.css" rel="stylesheet">

>Chaque TP est constitué d'une série d'exercices.
>
>1. Ouvrez deux fenêtres : une pour ce tutoriel et l'autre pour le QCM (questionnaire) associé au tutoriel (vous trouverez le lien sur AMETICE).
>
>2.  Suivez ce tutoriel et faites les exercices. Les questions, mais pas les explications, se trouvent également dans le QCM.
>
>3.  Répondez aux questions au fur et à mesure dans le QCM.
>
>4. Attention! Si vous ne suivez pas le tutoriel, les questions de QCM peuvent être ambiguës. Ne faites pas l'impasse sur le tutoriel, c'est le cœur de l'apprentissage dans cet enseignement.
>
>5. Attention aux réponses libres du questionnaire : 
>
>    * Ecrivez les nombres **sans espace et sans virgule**. Par exemple : `9365589` plutôt que `9 365 589` ou `9,365,589`.
>    * Utilisez le **point** comme **séparateur de décimales**. Par exemple `3.14` plutôt que `3,14`.
>    * Si on demande un **pourcentage** écrivez uniquement le nombre sans le signe %. Par exemple `30` et non `30%` ou `0.3`.
>    * Si on demande une **proportion** ne donnez pas la réponse en pourcentage. Par exemple écrivez `0.3` et non `30%`.


## Contenu

* Prérequis
* Introduction
* Objectifs
* Contrôle des connaissances
* Tutoriel
    * Exercice 1 - UniprotKb/Swiss-prot, base de données de séquences protéiques
    * Exercice 2 - Alignement par paires
    * Exercice 3 - BLAST: Recherche par similarité dans les bases de données de séquences
    * Exercice 4 - Y a-t-il des insertions de séquences de HIV dans le génome de SARS-CoV-2 ?
* Concepts
* Ressources

## Prérequis

Le matériel de support est disponible ici : [diapos CM1](../slides/NC3_enquete-bioinfo-origines-SARS-CoV-2_CM1.pdf)

Lors du premier cours, nous avons présenté une introduction aux concepts biologiques liés à l'origine de coronavirus SARS-CoV-2, et commencé à fournir les premiers éléments pour l'analyse bioinformatique des séquences.

* Biologie de SARS-CoV-2
* Bases de données biologiques
* Alignements par paires
* Recherche de séquences par similarité

## Introduction

## Objectifs des TP

Le but de cette série de TP sera d'utiliser des méthodes et outils bioinformatiques afin de retracer l'origine de SARS-CoV-2.

**Objectifs spécifiques**

- TP1 
    - Apprendre à formuler une requête structurée pour obtenir la liste des séquences dans une base de données.
    - Effectuer des alignements par paires.
    - Effectuer une recherche par similarité de séquences.

- TP2 
    - Effectuer des alignements multiples.
    - Inférer des arbres phylogénétiques basés sur différentes protéines des coronavirus pour pouvoir démontrer l'importance des recombinaisons entre différents virus.


## Contrôle des connaissances

Les tutoriels sont entrecoupés des questions auxquelles vous pouvez répondre en un ou quelques mots. Nous vous indiquerons, au fil de ce TP, les moments où il vous faudra encoder les réponses dans les questionnaires du site [Ametice](https://ametice.univ-amu.fr/course/view.php?id=62928#section-7). 



## Tutoriel


### Exercice 1 - UniprotKb/Swiss-prot, base de données de séquences protéiques

Dans cet exercice, vous allez apprendre à faire des requêtes naïves et structurées pour trouver les protéines qui vous intéressent et découvrir le type d'information disponibles dans Uniprot.

1. Ouvrez une connexion à la base de données [Uniprot](https://www.uniprot.org/).
2. Le page d'accueil affiche le nombre des séquences accessibles dans UniProt.

```question
Questions 1.1 - Uniprot - Page d'accueil

1.1.1. Quelle est le nom de la base de données contenant uniquement des séquences annotées par un humain (reviewed) ?
1.1.2 Combien de séquences contient-elle ?
1.1.3 Quelle est le nom de la base de données contenant uniquement des séquences annotées automatiquement et qui n'ont fait l'objet d'aucune vérification par un être humain ?
1.1.4 Combien de séquences contient-elle ?
```


3. **Requête naïve** :  Dans la boîte de requêtes (en haut de la page), tapez les mots-clés suivants pour sélectionner les protéines spike de SARS-CoV-2 : *spike sars-cov-2*. 

- Vous pouvez sélectionner des champs à afficher dans le tableau de résultats. Cliquez sur le bouton **Columns**. Vous trouverez tous les champs possibles à afficher regroupés par catégories. Affichez l’identifiant de la séquence (*Entry name*), le *nom de la protéine*, le nom de l'espèce (*Organism*), et la *longueur de la séquence*. Enregistrez ce réglage (**Save**).
   
- La table de résultats est mise à jour, avec l'ajout de colonnes indiquant les informations que vous avez sélectionnées. Toutes les protéines proviennent des SARS-CoV-2 ? Sont-ils tous des protéines Spike ? (Vous pouvez trier le tableau en fonction d’une colonne à l’aide des triangles à côté du nom de la colonne.) 
  
- Cliquez sur l'identifiant **Q9BYF1** dans le tableau de résultats pour examiner les annotations de cette protéine. (Vous pouvez afficher plus de séquences par page à l'aide de menu déroulant *Show* et faire une recherche de texte dans la page avec *Ctrl-F*)


```question
Questions 1.2 - Uniprot - Requête naïve

1.2.1 De quelle espèce provient cette séquence ?
1.2.2 Quelles sont ses fonctions ?
1.2.3 Dans quels champs apparait le mot 'Spike' ? (Vous pouvez faire une recherche de texte dans la page avec Ctrl-F)
1.2.4 Dans quels champs apparait le mot 'SARS-CoV-2' ? (Vous pouvez faire une recherche de texte dans la page avec Ctrl-F).

Répondez par VRAI ou FAUX

1.2.5 Pourquoi la recherche naïve 'spike sars-cov-2' n'est pas précise dans notre cas ?
```


4. **Requête structurée** :

     - Cliquez sur **Advanced** à côté de la boîte de recherche.
     - Effacez vos termes de recherche précédents en cliquant sur les petites poubelles à côté des boîtes.
     - Dans le champ **All**, sélectionnez **Organism [OS]**, et commencez à taper *SARS-CoV-2*.  Au fil de votre encodage, l'interface Uniprot affiche un menu de plus en plus restreint, avec la liste des organismes correspondant à ce que vous avez tapé. Sélectionnez *Severe acute respiratory syndrome coronavirus 2 (2019-nCoV) [2697049]* et cliquez sur **Search** pour lancer la recherche. (2697049 est l'identifiant taxonomique du virus SARS-CoV-2)
     - Nous avons obtenu 75730 séquences (4/11/2021), dont 16 ont été annotées par un être humain (Swiss-Prot)
     - Pour ajouter un filtre de sélection, cliquez à nouveau sur **Advanced**.
     - Notez l'opérateur logique **AND** en début de ligne (il correspond à nos besoins, mais pour d'autres requêtes nous pourrions utiliser NOT ou OR.
     - Sélectionnez le champ **Protein name [DE]**, entrez *spike* et lancez la recherche. La sélection correspond-elle mieux à vos attentes ?
     - Lisez attentivement la requête structurée qui apparaît dans la boîte de requête. L'interface interactif convertit automatiquement vos requêtes en une phrase que vous pourrez éventuellement réutiliser ou adapter ultérieurement.
     - Vous pouvez facilement sélectionner les protéines de Swiss-prot, en cliquant sur **reviewed (1)**, en haut à gauche. 
     - Notez la modification de la formule syntaxique pour la requête structurée.

5. **Sauvegarde de la table des résultats et des séquences** :

     - Vous pouvez télécharger les résultats de votre recherche à l'aide du bouton **Download**.
     - Uniprot vous permet d'exporter les résultats dans divers formats. Les formats les plus pratiques pour les tableaux de résultats sont **Tab-Delimited** ou Excel. 
     - Pour obtenir les séquences, le format le plus souvent utilisé est le format **fasta**. Choisissez le fomat **fasta (canonical)** et la version **Uncompressed**.
     - Sauvegardez le fichier fasta sur votre ordinateur, et ouvrez-le avec un éditeur de texte simple (Notepad++, gedit, Bloc-notes). Vérifiez le format des séquences. 
     - Un fichier fasta peut contenir plusieurs séquences, chacune étant précédée d'une ligne de description commençant par un caractère **>**. Le premier mot de la ligne de description (ce qui précède le premier espace) est l'identifiant de la séquence (par exemple `sp|P0DTC2|SPIKE_SARS2`). La ligne de description peut éventuellement contenir des commentaires libres (dans l'exemple ci-dessus: *Spike glycoprotein OS=Severe acute respiratory syndrome coronavirus 2 OX=2697049 GN=S PE=1 SV=1*).
     - Le fichier devrait ressembler à ceci :

```question
>sp|P0DTC2|SPIKE_SARS2 Spike glycoprotein OS=Severe acute respiratory syndrome coronavirus 2 OX=2697049 GN=S PE=1 SV=1
MFVFLVLLPLVSSQCVNLTTRTQLPPAYTNSFTRGVYYPDKVFRSSVLHSTQDLFLPFFS
NVTWFHAIHVSGTNGTKRFDNPVLPFNDGVYFASTEKSNIIRGWIFGTTLDSKTQSLLIV
NNATNVVIKVCEFQFCNDPFLGVYYHKNNKSWMESEFRVYSSANNCTFEYVSQPFLMDLE
GKQGNFKNLREFVFKNIDGYFKIYSKHTPINLVRDLPQGFSALEPLVDLPIGINITRFQT
...
```

6. Faites une recherche structurée pour trouver les protéines *ENV* et *GAG* du virus *Human immunodeficiency virus type 1 group M subtype A (isolate MAL) (HIV-1)*  présentes dans SwissProt.

    **Attention!** En utilisant les connecteurs logiques AND et OR dans la même requête, il est recommandé d'ajouter des parenthèses manuellement dans la phrase de recherche.


```question
Questions 1.3 - Uniprot - Requête structurée

1.3.1 Combien de protéines avez-vous trouvées ?
1.3.2 Quel est l'identifiant de la protéine 'Envelope glycoprotein' parmi vos résultats ?
```

### Exercice 2 - Alignements par paires

Pour pouvoir comparer deux séquences il est nécessaire de les aligner. Ceci va permettre de calculer le pourcentage d'identité entre les séquences et détecter des mutations (substructions, indels) entre elles. Dans cet exercice vous allez utiliser un logiciel d'alignement deux à deux (ou alignement par paires) qui aligne la totalité des deux séquences  (tous les résidus). **[needle](https://www.ebi.ac.uk/Tools/psa/emboss_needle/)** est l'abréviation du nom de l'algorithme de Needleman et Wunsch. Ce type d'alignement s'appelle **alignement global**  par opposition à l'alignement local qui n'aligne que les portions des séquences significativement similaires.

1. Nous avons extrait des séquences du gène S (codant pour la protéine Spike) à partir de 3 génomes complets et nous avons identifié les séquences protéiques correspondantes.

    Utilisez les liens dans le tableau ci-dessous pour accéder aux séquences protéiques en format fasta. l'extraction des séquences de gène S à partir de génome complet est un peu plus longue. Nous avons fait le travail pour vous. Vous trouverez les séquences ARN de gène S dans le fichier suivant : [S-gene_3.fasta](../data/S-gene/S-gene_3.fasta)

|Virus | Hôte |Génome | Protéine spike |
|--------|---------|---------------------|---------------------------|
|SARS-CoV-2_WH01_2019| *Homo sapiens* | [MT019529.1](https://www.ncbi.nlm.nih.gov/nuccore/MT019529.1)|[QHU36824.1](https://www.ncbi.nlm.nih.gov/protein/QHU36824)|
|RaTG13_2013_Yunnan| *Rhinolophus affinis* |[MN996532.1](https://www.ncbi.nlm.nih.gov/nuccore/MN996532.1)|[QHR63300.2](https://www.ncbi.nlm.nih.gov/protein/QHR63300.2)|
|MERS_172-06_2015| *Homo sapiens* |[KT868877.1](https://www.ncbi.nlm.nih.gov/nuccore/KT868877.1)|[ALK80311.1](https://www.ncbi.nlm.nih.gov/protein/ALK80311.1)|

2. Un logiciel d'alignement par paires **[needle](https://www.ebi.ac.uk/Tools/psa/emboss_needle/)** est disponible sur le site de centre de ressources [EBI](https://www.ebi.ac.uk/). Utilisez ce logiciel pour aligner le gène S de SARS-CoV-2 avec les deux autres virus (Faites deux alignements dans deux onglets séparés)

     * En STEP 1, sélectionnez **DNA**, à la place de PROTEIN, et copiez les chacune des deux séquences ARN à aligner dans les deux cases suivantes.
     * Laissez les autres paramètres par défaut, et lancez l'alignement (**Submit**)

```question
Questions 2.1 - Alignement par paires - Gene S

2.1.1 Quel est le pourcentage d'identité entre les gènes S de SARS-CoV-2 et RaTG13_2013_Yunnan ?
2.1.2 Quel est le pourcentage d'identité entre les gènes S de SARS-CoV-2 et MERS_172-06_2015 ?
2.1.3 Quel est le pourcentage des gaps dans l'alignment entre les gènes S de SARS-CoV-2 et MERS_172-06_2015 ?
```

3. La similarité entre les gènes SARS-CoV-2 et MERS_172-06_2015, n'est pas très convainquante. On observe beaucoup de gaps sur la totalité de l'alignement. Alignons maintenant les séquences **protéiques** (les liens sont donnés dans le tableau ci-dessus). Utilisez toujours [needle](https://www.ebi.ac.uk/Tools/psa/emboss_needle/), mais sélectionnez **PROTEIN** en STEP1.

```question
Questions 2.2 - Alignement par paires - Protéine Spike

2.2.1 Quel est le pourcentage d'identité entre les protéines Spike de SARS-CoV-2 et RaTG13_2013_Yunnan ?
2.2.2 Quel est le pourcentage d'identité entre les protéines Spike de SARS-CoV-2 et MERS_172-06_2015 ?
2.2.3 Quel est le pourcentage de gaps dans l'alignment entre les gènes S de SARS-CoV-2 et MERS_172-06_2015 ?

Répondez par VRAI ou FAUX
2.2.4 Bien que le pourcentage d'identité entre les protéines de SARS-CoV-2 et MERS_172-06_2015 soit plus faible qu'entre les gènes, l'alignement des protéines comporte moins de gaps et la similarité entre des séquences semble plus convainquante.
```



### Exercice 3 - BLAST: Recherche par similarité dans les bases de données de séquences

Dans l'exercice précédent, vous avez aligné un gène ou protéine à deux autres séquences pour pouvoir les comparer. Si vous voulez comparer la même séquence à toute les séquences d'une base de données pour pouvoir repérer les séquences similaires, cette approche n'est pas tenable. L'outil [BLAST](https://blast.ncbi.nlm.nih.gov/Blast.cgi) remplit cette tâche avec une vitesse tout à fait raisonnable malgré la taille énorme des bases de données ([1000 milliards de nucleotides en GenBank en oct 2021](https://www.ncbi.nlm.nih.gov/genbank/statistics/)). Il repère les séquences similaires à une séquence requête et aligne les régions significativement similaires entre la séquence requête et les séquences de la BDD. BLAST fait donc des alignement locaux.
Dans cet exercice, vous allez comparer la **protéine Spike SARS-CoV-2** à la BDD protéique de NCBI (Genpept) pour identifier les homologues venant des autres virus. 




>**Point de nomenclature**
>Pour respecter la nomenclature de BLAST sans utiliser de périphrases en français, nous utiliserons ci-dessous les noms de **hit** ou **HSP** (High Scoring Pair) pour désigner une séquence de la base de données rapportée par BLAST comme similaire à la séquence requête. 



1. Récupérez la séquence de la protéine Spike de SARS-CoV-2 sur NCBI: [QHU36824.1](https://www.ncbi.nlm.nih.gov/protein/QHU36824)

2. Faites un BLAST en utilisant la protéine [QHU36824.1](https://www.ncbi.nlm.nih.gov/protein/QHU36824) comme séquence requête contre la BDD NCBI protéine.    

     1. Connectez-vous au site Web [BLAST du NCBI](http://blast.ncbi.nlm.nih.gov/) et sélectionnez l'outil **protein blast (BLASTp)**, qui compare des séquences protéiques avec les banques de données protéiques.
     2. Copiez votre séquence requête (y compris la ligne de description) dans la fenêtre **Enter accession number(s), gi(s), or FASTA séquence(s)**.  Alternativement, vous pouvez copier l'identifiant de votre séquence dans la même fenêtre, ou si vous avez téléchargé la séquence requête en format fasta, vous pouvez sélectionner ce fichier (upload file).
     3. Observez les différentes bases de données disponibles dans le menu déroulant **Database**.     Sélectionnez la base de données non-redondante (**non-redundant protein sequences (nr)**. 
     4. L'option **Organism** permet de spécifier un nom de taxon auquel on veut limiter la recherche ou au contraire, le taxon qu'on veut exclure de la recherche (en cochant la case **exclude**)
         L'interface assure la *complétion automatique* : quand vous commencez à taper un nom d'organisme ou de taxon, les noms compatibles sont affichés, et leur choix se restreint au fur et à mesure que vous complétez le nom. Chaque nom de taxon est suivi par un identifiant taxonomique (taxid), pour éviter les éventuelles homonymes.
         Tapez *Merbecovirus* dans ce cadre et sélectionnez **Merbecovirus (taxid:2509494)** pour limiter la recherche aux séquences de ce groupe.
     5. Sélectionnez l'algorithme **blastp** (option par défaut). 
     6. Cochez la case **Show results in a new window** pour que les résultats apparaissent dans une nouvelle fenêtre.
     7. Cliquez sur **Algorithm parameters** pour voir les paramètres de BLAST qui sont modifiables et leurs valeurs par défaut.
         - Sélectionnez 500 pour Max target sequences pour afficher jusqu'à 500 séquences similaires à la protéine requête.
         - Modifiez le Expect threshold à 1e-10 pour afficher les hits (alignements) avec une E-valeur jusqu'à 1e-10.
	 - Laissez les autres options proposées par défaut
     8. Lancez la recherche à l'aide du bouton **BLAST** et soyez patient pour l'obtention des résultats.


3. Observez la page de résultat de BLAST qui apparait après quelques secondes/minutes. Il est est composé de 4 onglets  essentiels :

     - **Description** : Chaque ligne affiche un hit (alignement/séquences) et quelques indices élémentaires (score, couverture de la séquence requête par l'alignement, E-valeur…)
     - **Graphic summary** : *Distribution of the top ### Blast Hits on ### subject sequences*. La barre épaisse turquoise représente la séquence requête. Les autres barres fines représentent les fragments de séquences similaires à la séquence requête trouvés dans la BDD. Le code de couleurs est basé sur le score des alignements.
     - **Alignments** : Alignements deux à deux.
     - **Taxonomy** : Représentation des hits selon leurs origines taxonomiques
  4. Parmi les hits examinez l'alignement de la séquence requête avec la séquence **ALK80311.1**. (Vous pouvez utilisez la recherche Ctrl-F pour retrouver l'identifiant dans la page de **Descriptions**) C’est la séquence de MERS_172-06_2015 que vous avez alignée dans l’exercice précédent avec la protéine spicule de SARS-Cov-2. Analysez l'alignement en tentant de faire le rapport entre les caractéristiques de l'alignement et les scores qui le caractérisent: score brut, identités, résidus "positifs" (identités et substitutions conservatives: substitution entre acides aminés de propriétés similaires), gaps, E-valeur.

```question
Questions 3.1 - BLAST - Alignmement de la Protéine Spike de SARS-Cov-2 avec la séquence ALK80311.1

3.1.1 Nom de l'organisme de la séquence ALK80311.1 
3.1.2 Nom scientifique de son hôte

Notez les valeurs des indices suivants
3.1.3 Longueur de l'alignement
3.1.4 Pourcentage d'identité
3.1.5 Pourcentage de positifs
3.1.6 Pourcentage de gaps
3.1.7 E-valeur (expect)

3.1.8 Que signifie la ligne entre les deux séquences comparées ?

Répondez par VRAI ou FAUX
3.1.9 La ressemblance entre ces deux protéines est presque parfaite, et l'alignement couvre la longueur totale des deux protéines.
3.1.10 La e-valeur indique qu'il est probable qu'un tel niveau de similarité résulte du hasard.
3.1.11 L'hypothèse la plus vraisemblable est que ces deux protéines se ressemblent parce qu'elles dérivent d'un ancêtre commun, autrement dit, on peut conclure qu'elles sont homologues.

```

5. Examinez l'alignement de la séquence requête avec la séquence **AHC74083.1** (Vous pouvez utilisez la recherche Ctrl-F pour retrouver l'identifiant dans la page de **Descriptions**). Analysez-le en tentant de faire le rapport entre les caractéristiques de l'alignement et les scores qui le caractérisent: score brut, identités, résidus "positifs" (identités et substitutions conservatives: substitution entre acides aminés de propriétés similaires), gaps, E-valeur.

```question
Questions 3.2 - BLAST - Alignement de la Protéine Spike de SARS-Cov-2 et la séquence AHC74083.1
Notez les valeurs des indices suivants du premier alignement
3.2.1 Longueur de l'alignement
3.2.2 Pourcentage d'identité
3.2.3 Pourcentage de positifs
3.2.4 Pourcentage de gaps
3.2.5 E-valeur (expect)

Répondez par VRAI ou FAUX

3.2.6 La ressemblance entre ces deux protéines est presque parfaite, et l'alignement couvre la longueur totale des deux protéines.
3.2.7 La e-valeur indique qu'il est probable qu'un tel niveau de similarité résulte du hasard.
3.2.8 L’alignement ne couvre qu’à peu près 10% de la séquence requête (QHU36824). Ceci est dû au fait que la séquence sujet (AHC74083.1) est partielle.
3.2.9 L'hypothèse la plus vraisemblable est que ces deux protéines se ressemblent parce qu'elles dérivent d'un ancêtre commun, autrement dit, on peut conclure qu'elles sont homologues.
```



### Exercice 4 - Y a-t-il des insertions de séquences de HIV dans le génome de SARS-CoV-2 ?

Dans cet exercice nous allons utiliser BLAST pour repérer les régions similaires entre le génome de SARS-CoV-2 ([MT019529.1](https://www.ncbi.nlm.nih.gov/nuccore/MT019529.1)) et la séquence référence du génome de virus de SIDA (HIV-1 taxid:11676).

1. Connectez-vous au site Web [BLAST du NCBI](http://blast.ncbi.nlm.nih.gov/) et sélectionnez l'outil **Nucleotide blast (BLASTn)**, qui compare des séquences nucléotidiques avec les banques de données nucléotidiques.

2. **Séquence requête** : [MT019529.1](https://www.ncbi.nlm.nih.gov/nuccore/MT019529.1)

3. **Database** : *RefSeq Genome Database (refseq_genomes)* pour se concentrer uniquement sur les génomes de référence

4. **Organism** *HIV-1 (taxid:11676)* pour limiter la recherche aux séquences de HIV-1

5. **Program Selection** : *Somewhat similar sequences (blastn)* pour augmenter la sensibilité de la recherche. 

6. Cochez la case **Show results in a new window** pour que les résultats apparaissent dans une nouvelle fenêtre.

7. **Algorithm parameters** : **Expect threshold** à *10* pour afficher les hits avec une E-valeur jusqu'à 10. Valeur par défaut pour les autres paramètres.

8. Lancez BLAST.

9. Gardez la page de résultats ouverte pour pouvoir répondre aux questions un peu plus tard.

Le génome de SARS-CoV-2 a 29899 nucléotides. Nous allons générer une séquence aléatoire (suite des nucléotides aléatoire) de même longueur et comparer cette séquence avec le génome de HIV-1 à l'aide de BLAST.

1. Connectez-vous au site web Regulatory Sequence Analysis Tools [RSAT]( http://metazoa.rsat.eu/), et utilisez l'outil **random sequence** (qui se trouve dans **Sequence tools**) pour générer une séquence aléatoire de 29899 nt :
	- **Sequence length** : *29899*
	- **Number of sequences** : *1*
	- **Background model** : *Independent and equiprobable nucleotides*
	- **GO**

2. Faites un BLAST avec cette séquence aléatoire comme séquence requête contre le génome de HIV-1

	- Choisissez **Nucleotide blast (BLASTn)** sur [NCBI BLAST](http://blast.ncbi.nlm.nih.gov/)
	- Copiez la séquence aléatoire dans le première case
	- Choisissez la **Database** : *RefSeq Genome Database (refseq_genomes)* pour se concentrer uniquement sur les génomes de référence
	- Sélectionnez Dans le champs **Organism** *HIV-1 (taxid:1167)* pour limiter la recherche aux séquences de HIV-1
	- **Program Selection**: *Optimize for Somewhat similar sequences (blastn)*
	- Cochez la case **Show results in a new window** pour que les résultats apparaissent dans une nouvelle fenêtre.
	-  **Algorithm parameters** : **Expect threshold** à *10* pour afficher les hits avec une E-valeur jusqu'à 10. Valeur par défaut pour les autres paramètres.
	-  Lancez la recherche à l'aide du bouton **BLAST**

```question
Questions 4.1 -  Y a-t-il des insertions de séquences de HIV dans le génome de SARS-CoV-2 ?

**Répondez aux questions suivantes sur base de la comparaison entre les génomes de SARS-CoV-2 et de HIV-1.**

4.1.1 Nombre de fragments alignés entre les génomes de SARS-CoV-2 et de HIV-1.
4.1.2 Meilleure E-valeur parmi ces alignements.
4.1.3 Pire E-valeur parmi ces alignements.
4.1.4 Longueur de l'alignement le plus long.
4.1.5 Pourcentage d'identité le plus élevé parmi ces alignements.
4.1.6 Pourcentage d'identité le plus bas parmi ces alignements.

**Répondez aux questions suivantes sur base de comparaison entre le génome de HIV-1 et la séquence aléatoire**

4.1.7 Nombre de fragments alignés entre les génome de HIV-1 et la séquence aléatoire.
4.1.8 Meilleure E-valeur parmi ces alignements.
4.1.9 La pire E-valeur parmi ces alignements.
4.1.10 Longueur de l'alignement le plus long.
4.1.11 Pourcentage d'identité le plus élevé parmi ces alignements.
4.1.12 Pourcentage d'identité le plus bas parmi ces alignements.

Répondez par VRAI ou FAUX sur base de la comparaison entre les génomes de SARS-CoV-2 et de HIV-1.
4.1.13 Le très haut pourcentage d'identité des alignements est suffisant pour conclure sur l'homologie entre des fragments alignés des deux génomes.
4.1.14 Les longueurs des alignements sont suffisamment élevées pour inférer l'homologie entre les fragments alignés.
4.1.15 Les E-valeurs indiquent qu'il est probable qu'un tel niveau de similarité résulte du hasard
4.1.16 Le fait d'avoir plusieurs fragments alignés entre les deux génomes indique une similarité significative entre les génomes
```



>## Concepts

>### E-valeur, Expect, E-value
>La e-valeur (en anglais: e-value ou expect pour expected value) représente le nombre de résultats qu'on s'attendrait à obtenir par hasard, en fonction des paramètres utilisés pour un programme.
>
>Par exemple, le logiciel BLAST caractérise chaque alignement par une e-valeur, qui est calculée en fonction du le score brut, de la longueur des protéines alignées, et de la taille de la base de données (quand la taille d'une base de données augmente, on a plus de chances d'observer un hit fortuit). La e-valeur est le paramètre le plus informatif, d'une part parce qu'elle tient compte de l'ensemble des autres paramètres, d'autre part parce que son interprétation est directe: elle nous informe quant au risque que nous prenons si nous considérons la similarité comme significative. La e-valeur est liée au concept de risque de faux positifs: le risque de considérer comme significatif un résultat qui ne l'est pas.
>
>Une e-valeur faible indique qu'un résultat est statistiquement significatif.
>
>Par exemple, si un alignement obtenu par BLAST est associé à une e-valeur de 1e-3, cela signifie qu'on s'attendrait à 0.001 faux-positifs dans des conditions similaires. Autrement dit, si l'on faisait l'analyse avec des séquences aléatoires, un alignement d'aussi bonne qualité sortirait en moyenne une fois sur 1000.
>	
>Au contraire, des résultats associés à une e-valeur supérieure à 1 devraient toujours être considérés avec prudence (je dirais même méfiance). En effet, une e-valeur de 10 signifie que si l'on avait effectué une analyse avec des données aléatoires, on s'attendrait à obtenir une dizaine de résultats. Ces résultats pourraient être qualifiés de faux-positifs, c'est-à-dire des éléments déclarés significatifs alors qu'ils ne le sont pas. Il est donc généralement recommandé d'imposer un seuil stringent sur l'e-valeur.
>	
>Il n'est pas rare que des alignements de BLAST retournent une e-valeur très basse, par exemple 1e-150. Ce score très significatif indique qu'il est extrêmement improbable que ce la similarité entre la protéine requête et le hit provienne du hasard. L'hypothèse alternative est que cette similarité de séquence reflète le fait que les deux séquences dérivent d'un ancêtre commun. Dans un tel cas, on peut conclure que les deux séquences sont très vraisemblablement homologues.
>	
>Dans certains cas, les programmes affichent une e-valeur de 0. Ceci ne signifie pas qu'il est formellement impossible d'obtenir un tel alignement par hasard, mais que la e-valeur est inférieure à la limite de précision de BLAST (~1e-172).
>
>La e-valeur ne s'applique pas uniquement aux résultats de BLAST. La plupart des logiciels bioinformatiques indiquent la significativité des résultats, sous forme de e-valeur ou d'autres statistiques apparentées. Il est essentiel de pouvoir interpréter ces nombres pour éviter de se faire flouer par un résultat apparemment prometteur.

## Ressources bioinformatiques

| Ressource | Description | URL |
|-----------|--------------------------------|-------------------------------|
| Supports de ce cours | Diapos, tuto, données | [jvanheld.github.io/shnc-origines-sars-cov-2/](https://jvanheld.github.io/shnc-origines-sars-cov-2/) |
| Uniprot | Base de donnée de séquences protéiques | [www.uniprot.org/](https://www.uniprot.org/) |
| NCBI Entrez | Bases de données biologiques | [www.ncbi.nlm.nih.gov/](https://www.ncbi.nlm.nih.gov/) |
| EMBOSS needle | Alignement de paires de séquences | [www.ebi.ac.uk/Tools/psa/emboss_needle/](https://www.ebi.ac.uk/Tools/psa/emboss_needle/) |
| NCBI BLAST | Recherche de séquences par similarité | [blast.ncbi.nlm.nih.gov/Blast.cgi](https://blast.ncbi.nlm.nih.gov/Blast.cgi) |
| AMU | page AMETICE de N&C3 | [ametice.univ-amu.fr/course/view.php?id=62928](https://ametice.univ-amu.fr/course/view.php?id=62928#section-7) |


