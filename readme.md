##Description

Ce repo contient des scénarios de Stress test JMeter pour Drupal 7.
Certaines notions sont spécifiques à la distribution Drupal dpi247

Il y a plusieurs scénarios:

* Un mode anonyme
* Un mode connecté.
* Un mode Webmaster (devel/cache/clear et node_save() )
* Un mode connecté avancé avec recherche et ecriture de commmentaire.



##Preparation

Afin d'effectuer les tests de sur une DB réele, quelques steps de préparation sont nécéssaires:

### Création d'un fichier de nodes
Pour le fichier url-nodes.csv
```
SELECT CONCAT('/node/', nid) FROM node WHERE STATUS = 1
  ORDER BY changed LIMIT 1000;

```

### Création d'un fichier de page de section (propre à dpi247)

Veillez à ce que le vid soit bien le vocabulaire de section...

Pour le fichier url-sections.csv
```
  SELECT CONCAT('/section/', tid) FROM taxonomy_term_data WHERE vid = 3
   LIMIT 1000;
```


## Mode Anonyme (Drupal7-Stress-Anonymous)

Ceci represente le parcours d'un utilisateur anonyme.

* Il arrive sur la homepage, 
* Prend une page de section provenant de url_sections.csv
* Lis trois articles provenant de url_nodes.csv
* Une autre page de section provenant de url_sections.csv




## Mode Connecté (Drupal7-Stress-Auth)

Ceci represente le parcours d'un utilisateur anonyme.

* Il arrive sur le formulaire de login, 
* Fait un login en post
* Prend une page de section provenant de url_sections.csv
* Lis trois articles provenant de url_nodes.csv
* Une autre page de section provenant de url_sections.csv
* Fais un logout


# Notes


## Introduction de délais

## Introduction d'un contraite de bande passante 

Il faut veiller à introduire des contraintes de bandes passantes sur le surf des visiteurs ( http://wiki.apache.org/jmeter/Controlling%20Bandwidth%20in%20JMeter%20to%20simulate%20different%20networks  )

thx @tomhtml ;)

## Parcours des fichiers CSV

Parcour la liste des urls-nodes et des url-sections et GET sequentiellement chacun une seule fois.

Il y a donc autant d'action qu'il y a d'url dans la liste (?)

En fonction de du nombre de "thread_count" dans la boucle for represente le nombre de threads concurent qui effectuent une même action. 

Si il y a plusieurs threads, ils ne prennent pas les mêmes lignes d'un même fichier CSV.
On continue temps que le plus long fichier (node) n'a pas été totalement testé, les autres test (section, homepage) recommencent au debut du fichier CSV (ou alors il faut changer la politique EOF)
http://jmeter.apache.org/usermanual/component_reference.html#CSV_Data_Set_Config



# Credits

* http://www.metaltoad.com/blog/jmeter-test-plan-drupal
* http://www.phase2technology.com/blog/using-jmeter-to-test-performance-of-drupal-with-authenticated-users/
* http://jmeter.apache.org/usermanual/component_reference.html
* http://www.slideshare.net/burgerboydaddy/load-test-drupal-site-using-jmeter-and-amazon-aws
* http://wiki.apache.org/jmeter/Controlling%20Bandwidth%20in%20JMeter%20to%20simulate%20different%20networks
