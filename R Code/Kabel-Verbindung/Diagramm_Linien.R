#Daten als .csv importieren
#Datenformat: Die Messreihen in unterschiedliche Spalten schreiben, pro Messreihe beliebig viele Messwerte, dann aber Farbvariable unten anpassen.
# Folgende spalten sollten vorhanden sein: "Messtyp",	"Messwert",	"Group",	"Messtyp2",	"Messwert2", "Group2",

daten <- read.csv("daten.csv")

#nötige Pakete laden
library("ggplot2")

#Plot zwei getrennte Linien
##ggplot-Befehl mit den aessthetics für Linie1 und Farbvariable sowie parameter group
ggplot(daten, aes(y=Group, x=Messwert,colour=Group, group=1)) +
   #Linie1
   geom_line(size=1.25) + #Linie
   geom_point(size=3) + #Punkte
   geom_text(aes(label=Messtyp), vjust=1.7) + #Labels unterhalb der Linie
   geom_text(aes(label=Messwert), vjust=-1.2) + #Labels oberhalb
   
   #Linie2 aes muss jeweils neu gesetzt werden, da jetzt andere Datengrundlage, ansonsten siehe oben
   geom_line(aes(x=Messwert2, y=Group2, colour=Group2, group=1),size=1.25) +
   geom_point(aes(x=Messwert2, y=Group2, colour=Group2),size=3) +
   geom_text(aes(x=Messwert2, y=Group2, colour=Group2, label=Messtyp), vjust=1.7) +
   geom_text(aes(x=Messwert2, y=Group2, colour=Group2, label=Messwert2), vjust=-1.2)+
   
   #scale_color_manuel um die Einträge der Farbvariable (hier Group) zu definieren
   scale_color_manual(
      values = c(
         "SP_CSS DATEN"="#b00b1e",
         "SP_CSS + SP_BILDER DATEN" = "#040661"),
      
      #Hier Titel für Legende eingeben
      name="Legende", 
      
      #hier Namen für Legendenelemente eingeben
      labels=c("SP_CSS DATEN", "SP_CSS + SP_BILDER DATEN") 
      ) +
   
   #mit theme die Achsenbeschriftungen entfernen
   theme(
      axis.ticks.y = element_blank(),
      axis.text.y = element_blank(),
      axis.text.x = element_blank(),
      axis.ticks.x=element_blank(),
      axis.title = element_blank()
   )