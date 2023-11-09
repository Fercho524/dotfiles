Balabolka (application console), version 1.81
Copyright (c) 2013-2023 Ilya Morozov
All Rights Reserved

WWW : http://www.cross-plus-a.com/fr/bconsole.htm
E-mail : crossa@list.ru

Licence : Freeware
Syst�me d'exploitation : Microsoft Windows XP/Vista/7/8/10/11
Microsoft Speech API : v4.0/5.0 and above
Microsoft Speech Platform : v11.0



*** Ligne de commande ***

balcon [options ...]


*** Param�tres de ligne de commande ***

-l
   Affiche la liste des voix disponibles.

-g
   Affiche la liste des p�riph�riques de sortie audio disponibles.

-f <nom_de_fichier>
   Sp�cifie le nom du fichier texte d'entr�e. La ligne de commande peut contenir quelques options [-f].

-fl <nom_de_fichier>
   Ouvrir le fichier avec la liste des fichiers texte (un nom de fichier par ligne). La ligne de commande peut contenir quelques options [-fl].

-w <nom_de_fichier>
   Sp�cifie le nom du fichier de sortie au format WAV. Si l'option est sp�cifi�e, un fichier audio sera cr��. Dans le cas contraire, le texte sera lu � haute voix.

-n <nom_de_voix>
   Sp�cifie le nom de la voix (la partie du nom est suffisant). 
   Si le param�tre n'est pas sp�cifi�, la voix d�finie par le param�tre [-id] ou la voix par d�faut de Windows sera utilis�e.

-id <nombre_int�gral>
   Sp�cifier le code de langue pour la voix (Language ID). Language ID est le code de langue attribu� par Microsoft
   (par exemple "1033" ou "0x0409" pour Anglais - �tats-Unis", "1036" ou "0x040C" pour "Fran�ais - France").
   Le logiciel choisit dans la liste de voix la premi�re voix avec l'ID sp�cifi�.
   Si le param�tre n'est pas sp�cifi�, la voix d�finie par le param�tre [-n] ou la voix par d�faut de Windows sera utilis�e.
   La liste de pays avec leurs Locale ID : https://msdn.microsoft.com/en-us/library/cc233982.aspx

-m
   Affiche les param�tres de la voix.

-b <nombre_int�gral>
   Sp�cifie le p�riph�rique audio par son index. L'index de l'appareil audio utilis� par d�faut est 0.

-r <texte>
   Sp�cifie le p�riph�rique audio par son nom.

-c
   Utilise le texte du presse-papiers.

-t <ligne_de_texte>
   Utilise le texte de la ligne de commande. La ligne de commande peut contenir quelques options [-t].

-i
   Utilise le texte de flux d'entr�e standard (STDIN).

-o
   SAPI 4 : l�option n�est pas utilis�e.
   SAPI 5 et Microsoft Speech Platform : enregistre les donn�es audio dans le flux de sortie standard (STDOUT) ; si l'option est sp�cifi�e, l'option [-w] est ignor�e.

-s <nombre_int�gral>
   SAPI 4 : sp�cifie le d�bit de la parole compris entre 0 et 100 (pas de valeur par d�faut).
   SAPI 5 et Microsoft Speech Platform : sp�cifie le d�bit de la parole compris entre -10 et 10 (la valeur par d�faut est 0).

-p <nombre_int�gral>
   SAPI 4 : sp�cifie le timbre de la voix compris entre 0 et 100 (pas de valeur par d�faut).
   SAPI 5 et Microsoft Speech Platform : sp�cifie le timbre de la voix compris entre -10 et 10 (la valeur par d�faut est 0).

-v <nombre_int�gral>
   SAPI 4 : l�option n�est pas utilis�e.
   SAPI 5 et Microsoft Speech Platform : sp�cifie le volume compris entre 0 et 100 (la valeur par d�faut est 100).

-e <nombre_int�gral>
   Sp�cifie la longueur des pauses entre les phrases (en millisecondes). La valeur par d�faut est 0.

-a <nombre_int�gral>
   Sp�cifie la longueur des pauses entre les paragraphes (en millisecondes). La valeur par d�faut est 0.

-d <nom_de_fichier>
   Utilise un dictionnaire pour la correction de la prononciation (fichier *.BXD, *.DIC ou *.REX). La ligne de commande peut contenir quelques options [-d].

-k
   D�sactive les autres copies de l'application console dans la m�moire de l'ordinateur.

-ka
   D�sactiver la copie de l'application console en cours d'ex�cution.

-pr
   Mettre sur pause ou reprendre la lecture � voix haute par la copie de l�application en cours pour la console. L�action est la m�me que pour s�lectionner un �l�ment de menu "Pause"/"Reprendre".

-q
   Met l'application dans une file d'attente. L'application console va attendre que les autres copies du programme terminent leur op�ration.

-lrc
   SAPI 4 : l�option n�est pas utilis�e.
   SAPI 5 et Microsoft Speech Platform : cr�e un fichier LRC, si l'option [-w] ou [-o] est sp�cifi�e.

-srt
   SAPI 4 : l�option n�est pas utilis�e.
   SAPI 5 et Microsoft Speech Platform : cr�e un fichier SRT, si l'option [-w] ou [-o] est sp�cifi�e.

-vs <nom_de_fichier>
   SAPI 4 : l�option n�est pas utilis�e.
   SAPI 5 et Microsoft Speech Platform : cr�er un fichier texte avec des vis�mes, si le param�tre [-w] est donn�.
   Un vis�me est la forme de la bouche qui correspond � un son de parole particulier. SAPI supporte la liste de 21 vis�mes.
   Cette liste est bas�e sur les vis�mes originaux de Disney. L�application console cr�era un fichier audio, puis le lira � haute voix pour obtenir des vis�mes et leurs codes temporels.
   La liste des vis�mes support�s par SAPI 5 : https://msdn.microsoft.com/en-us/library/ms720881(v=vs.85).aspx

-sub
   Le texte constitue des sous-titres et doit �tre converti en fichier audio, compte tenu des pauses sp�cifi�es. Le param�tre peut �tre utile lorsque les options [-i] ou [-c] sont sp�cifi�es en ligne de commande.

-tray
   Afficher l'ic�ne du logiciel dans la zone de notification du syst�me d'exploitation.
   Cela permet � l'utilisateur de suivre l'ex�cution d'une op�ration et de l'arr�ter � l'aide de l'�l�ment ��Arr�t�� dans le menu contextuel.

-ln <nombre_int�gral>
   S�lectionner une ligne du fichier texte � l'aide de son num�ro. La num�rotation des lignes commence par "1".
   Pour s�lectionner plusieurs lignes, sp�cifiez les num�ros de la ligne de d�part et de celle d'ach�vement dans le texte (par exemple, "26�34").
   La ligne de commande peut contenir quelques options [-ln].

-fr <nombre_int�gral>
   SAPI 4 : l�option n�est pas utilis�e.
   SAPI 5 et Microsoft Speech Platform : s�lectionner la fr�quence d��chantillonnage audio de sortie en kHz (8, 11, 12, 16, 22, 24, 32, 44, 48).
   Si le param�tre n�est pas sp�cifi�, la valeur par d�faut de la voix s�lectionn�e sera utilis�e.

-bt <nombre_int�gral>
   SAPI 4 : l�option n�est pas utilis�e.
   SAPI 5 et Microsoft Speech Platform : d�finir la profondeur de bits audio de sortie (8 ou 16).
   Si le param�tre n�est pas sp�cifi�, la valeur par d�faut de la voix s�lectionn�e sera utilis�e.

-ch <nombre_int�gral>
   SAPI 4 : l�option n�est pas utilis�e.
   SAPI 5 et Microsoft Speech Platform : d�finir le mode du canal audio de sortie (1 ou 2).
   Si le param�tre n�est pas sp�cifi�, la valeur par d�faut de la voix s�lectionn�e sera utilis�e.

-dp
   Afficher les informations sur l�avancement dans la fen�tre de console.

-h
   Affiche la liste des options de ligne de commande.

--encoding <encodage> ou -enc <encodage>
   L'encodage du texte de flux d'entr�e standard ("ansi", "utf8" ou "unicode"). La valeur par d�faut est "ansi".

--silence-begin <nombre_int�gral> ou -sb <nombre_int�gral>
   Sp�cifier la longueur de la pause en d�but du fichier audio (en millisecondes). La valeur par d�faut est 0.

--silence-end <nombre_int�gral> ou -se <nombre_int�gral>
   Sp�cifier la longueur de la pause en fin du fichier audio (en millisecondes). La valeur par d�faut est 0.

--lrc-length <nombre_int�gral>
   Sp�cifie la longueur maximale des lignes de texte pour le fichier LRC (en caract�res).

--lrc-fname <nom_de_fichier>
   Sp�cifie le nom du fichier LRC. L'option peut �tre utile lorsque l'option [-o] est sp�cifi�e en ligne de commande.

--lrc-enc <encodage>
   Sp�cifie l'encodage pour le fichier LRC ("ansi", "utf8" ou "unicode"). La valeur par d�faut est "ansi".

--lrc-offset <nombre_int�gral>
   Sp�cifie le d�calage temporel pour le fichier LRC (en millisecondes).

--lrc-artist <texte>
   Sp�cifie une balise ID pour le fichier LRC : artiste.

--lrc-album <texte>
   Sp�cifie une balise ID pour le fichier LRC : album.

--lrc-title <texte>
   Sp�cifie une balise ID pour le fichier LRC : titre.

--lrc-author <texte>
   Sp�cifie une balise ID pour le fichier LRC : auteur.

--lrc-creator <texte>
   Sp�cifie une balise ID pour le fichier LRC : cr�ateur du fichier LRC.

--lrc-sent
   Ins�rer des lignes vides apr�s les phrases dans le fichier LRC.

--lrc-para
   Ins�rer des lignes vides apr�s les alin�as dans le fichier LRC.

--srt-length <nombre_int�gral>
   Sp�cifie la longueur maximale des lignes de texte pour le fichier SRT (en caract�res).

--srt-fname <nom_de_fichier>
   Sp�cifie le nom du fichier SRT. L'option peut �tre utile lorsque l'option [-o] est sp�cifi�e en ligne de commande.

--srt-enc <encodage>
   Sp�cifie l'encodage pour le fichier SRT ("ansi", "utf8" ou "unicode"). La valeur par d�faut est "ansi".

--raw
   SAPI 4 : l�option n�est pas utilis�e.
   SAPI 5 et Microsoft Speech Platform : sortie des donn�es audio comme fichiers PCM brut ; les donn�es audio sont sans l'en-t�te WAV.
   L'option est utilis�e avec l'option [-o].

--ignore-length ou -il
   SAPI 4 : l�option n�est pas utilis�e.
   SAPI 5 et Microsoft Speech Platform : omet la longueur des donn�es audio dans l'en-t�te WAV.
   L'option est utilis�e avec l'option [-o].

--sub-format <texte>
   Le format des sous-titres ("srt", "lrc", "ssa", "ass", "smi" ou "vtt"). Si le param�tre n'est pas sp�cifi�, le format est d�termin� d'apr�s l'extension du fichier des sous-titres.

--sub-fit ou -sf
   SAPI 4 : l�option n�est pas utilis�e.
   SAPI 5 et Microsoft Speech Platform : augmenter automatiquement le d�bit de la parole pour s'adapter aux intervalles sp�cifi�s dans les sous-titres.

--sub-max <nombre_int�gral> ou -sm <nombre_int�gral>
   SAPI 4 : l�option n�est pas utilis�e.
   SAPI 5 et Microsoft Speech Platform : sp�cifier le d�bit maximal de la parole dans une gamme de -10 � 10 (pour convertir des sous-titres en fichier audio).

--delete-file ou -df
   Supprimer le fichier texte apr�s la lecture � haute voix ou enregistrer le fichier audio.

--ignore-square-brackets ou -isb
   Ignorer le texte entre [les crochets].

--ignore-curly-brackets ou -icb
   Ignorer le texte entre {les accolades}.

--ignore-angle-brackets ou -iab
   Ignorer le texte entre <les crochets angulaires>.

--ignore-round-brackets ou -irb
   Ignorer le texte entre (les parenth�ses).

--ignore-url ou -iu
   Ignorer les adresses URL.

--ignore-comments ou -ic
   Ignorer les commentaires dans le texte. Les commentaires sur une seule ligne commencent par // et se poursuivent jusqu�� la fin de la ligne. Les commentaires multilignes commencent par /* et se terminent par */.

--voice1-name <nom_de_voix>
   SAPI 4 : l�option n�est pas utilis�e.
   SAPI 5 et Microsoft Speech Platform : s�lectionner une voix suppl�mentaire pr�vue pour lire des mots �trangers dans le corps du texte (il suffit d�indiquer une partie du nom de la voix). Le param�tre est utilis� conjointement avec le param�tre [--voice1-langid].
   Vous pouvez s�lectionner plusieurs voix pour diff�rentes langues � l�aide des param�tres [--voice2-name], [--voice3-name], etc.

--voice1-langid <identifiant_langue>
   S�lectionner un identifiant de langue pour la recherche des mots �trangers dans le texte. Le programme trouvera les lettres de la langue sp�cifi�e dans le texte et ajoutera des balises de changement de voix pour lire ces caract�res. Le param�tre est utilis� conjointement avec le param�tre [--voice1-name]. L�invite de commande peut contenir plusieurs param�tres [--voice1-langid]. On peut lister plusieurs identifiants, s�par�s par des virgules, au sein d�un m�me param�tre (par exemple : "fi,sv").
   La liste des identifiants de langue support�es par le programme (les codes des langues selon la norme ISO 639-1 sont utilis�s) : am, ar, az, ba, bg, be, ca, cs, cu, cv, da, de, el, en, es, et, eu, fi, fil, fr, ja, he, hi, hr, hu, hy, it, gn, gu, ka, kk-Cyr, kk-Lat, kn, ko, ky, lo, lt, lv, mk, no, pl, pt, ro, ru, sk, sl, sr-Cyr, sr-Lat, sv, tg, th, tk, tr, tt, uk, zh.

--voice1-rate <nombre_int�gral>
   D�finir le d�bit de parole pour la voix suppl�mentaire dans une plage de -10 � 10 (la valeur par d�faut est 0).

--voice1-pitch <nombre_int�gral>
   R�gler la hauteur de la voix suppl�mentaire dans une plage de -10 � 10 (la valeur par d�faut est 0).

--voice1-volume <nombre_int�gral>
   R�gler le volume de la voix suppl�mentaire dans une plage de 0 � 100 (la valeur par d�faut est 100).

--voice1-roman
   Utiliser la voix par d�faut pour lire les chiffres romains. Si une voix suppl�mentaire est d�finie pour la lecture des lettres latines, le programme ne changera pas de voix pour lire des chiffres romains.

--voice1-digit
   Utiliser la voix par d�faut pour lire des nombres compos�s de chiffres arabes. Si le param�tre n�est pas d�fini, les nombres seront lus par la voix suppl�mentaire s�ils c�toient des mots �trangers.

--voice1-length <nombre_int�gral>
   D�finir la longueur minimale du texte �tranger pour la lecture duquel le programme utilisera une voix suppl�mentaire (en caract�res).


*** Exemples ***

Cr�er un fichier texte avec une liste des voix install�es sur l�ordinateur�:

balcon -l


Afficher les caract�ristiques de la voix Microsoft Anna�:

balcon -n "Microsoft Anna" -m


Convertir le fichier texte BOOK.TXT en fichier audio BOOK.WAV�:

balcon -f "d:\Text\book.txt" -w "d:\Sound\book.wav" -n "Emma"


R�cup�rer le texte du presse-papiers, appliquer les r�gles des dictionnaires de correction de prononciation et lire � haute voix�:

balcon -n "Callie" -c -d "d:\rex\rules.rex" -d "d:\dic\rules.dic"


Lire le texte � partir de l�invite de commande � la vitesse et au volume sp�cifi�s�:

balcon -n "Mathieu" -t "Le texte sera lu lentement." -s -5 -v 70


Arr�ter les autres instances de l�application console�:

balcon -k


Convertir le texte de STDIN en fichier audio BOOK.WAV et cr�er un fichier BOOK.LRC�:

balcon -w "d:\Sound\book.wav" -i -lrc --lrc-length 80 --lrc-title "The Lord of the Rings"


Convertir les sous-titres en fichier audio FILM.WAV�:

balcon -f "d:\Text\film.srt" -w "d:\Sound\film.wav" -n "Laura" --sub-fit --sub-max 2


Lire � haute voix des phrases en fran�ais et en russe par des voix diff�rentes�:

balcon -f "d:\Text\book.txt" -n Aurelie --voice1-name Tatyana --voice1-langid ru


Un exemple de l'utilisation de l'application avec l'utilitaire LAME.EXE :

balcon -f d:\book.txt -n Julie -o --raw | lame -r -s 22.05 -m m -h - d:\book.mp3


Un exemple de l'utilisation de l'application avec l'utilitaire OGGENC2.EXE :

balcon -f d:\book.txt -n Julie -o -il | oggenc2 --ignorelength - -o d:\book.ogg


Un exemple de l'utilisation de l'application avec l'utilitaire WMAENCODE.EXE :

balcon -f d:\book.txt -n Julie -o -il | wmaencode - d:\book.wma --ignorelength


*** Fichier de configuration ***

Les options de ligne de commande peuvent �tre enregistr�es en tant que fichier de configuration � balcon.cfg � dans le m�me dossier que l'application console.

Exemple de fichier de configuration :
===================
-f d:\Text\book.txt
-w d:\Sound\book.wav
-n Microsoft Anna
-s 2
-p -1
-v 95
-e 300
-d d:\Dict\rules.bxd
-lrc
--lrc-length 75
--lrc-enc utf8
--lrc-offset 300
===================

Le programme peut combiner les options du fichier de configuration et celles de la ligne de commande.


*** Clips audio ***

Le logiciel permet d'ins�rer des liens vers des fichiers audio externes au format WAV (clips audio) dans le texte. La balise de clip audio ressemblera � ceci :

{{Audio=C:\Sounds\ring.wav}}

Si un lien vers un clip audio survient lors de la lecture d�un texte � haute voix, le logiciel se met en pause, lit le clip audio et ensuite reprend la parole.
Lors de la conversion de la parole en fichier audio, le clip audio externe sera int�gr� dans le fichier audio cr�� par le logiciel.


*** "Voice" Tag ***

S�il faut modifier une voix ou ses attributs, une balise sp�ciale peut �tre utilis�e pour SAPI 5 et Microsoft Speech Platform (les voix SAPI 4 ignoreront cette balise).

Format de la balise�:

{{Voice=Nom;Vitesse;Hauteur;Volume}}

- Nom � nom de la voix (un mot ou m�me une partie d�un mot suffit)�;
- Vitesse � vitesse de lecture (la valeur doit �tre entre -10 et 10) ;
- Hauteur � hauteur du son (la valeur doit �tre entre -10 et 10) ;
- Volume � volume du son (la valeur doit �tre entre 0 et 100).

La balise s�applique � tout le texte suivant. Les valeurs des attributs sont s�par�es au sein d�une m�me balise par des points-virgules. Par exemple�:

Le programme lira ce texte par la voix par d�faut. {{Voice=Audrey;0;0;100}} La voix Audrey lira le reste du texte.

Le contenu de la balise ne d�pend pas du registre des lettres. Les valeurs de certains attributs peuvent �tre omis�:

{{voice=mathieu;;;50}}

{{Voice=Thomas;-1}}

{{Voice=Suzanne}}

Pour retourner � la voix par d�faut choisie dans le programme, utilisez la balise ci-dessous�:

{{Voice=}}

Attention�! Il est impossible de basculer entre les voix SAPI 5 et les voix de Microsoft Speech Platform � l�aide des balises.


*** "Pause" Tag ***

Lorsque le programme convertit un texte en fichier audio, on peut utiliser une balise pour ins�rer une pause. La dur�e de la pause doit �tre sp�cifi�e en millisecondes.

Le silence durera deux secondes. {{Pause=2000}} Ensuite, la lecture reprendra.


*** Licence ***

Droits d'utilisation non commerciale de l�application :
- personnes physiques � sans restriction,
- personnes morales � avec les restrictions stipul�es dans l'Accord de Licence du logiciel Balabolka.

L�utilisation commerciale du logiciel demande l'autorisation du d�tenteur du copyright.

###