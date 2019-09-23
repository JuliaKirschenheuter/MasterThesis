#Daten importieren
daten <- read.csv("HTTP2 vs. HTTP2 Server Push/SP_CSS, SP_Bilder vs. SP_CSS/TTFB/daten_all.csv", sep=";")

#Werte des Boxplots zwischenspeichern
##Messreihen separieren
reihe1 <- subset(daten, Reihe=="Server Push_CSS und _Bilder")
reihe2 <- subset(daten, Reihe=="Server Push_CSS")
##Werte für unterer Whisker, q1
stats1 <- boxplot.stats(reihe1$Werte)
stats2 <- boxplot.stats(reihe2$Werte)
labels1 <- as.character(reihe1$Reihe[1:5])
labels2 <- as.character(reihe2$Reihe[1:5])
labels <- data.frame(Werte = c(stats1$stats, stats2$stats), Reihe = c(labels1,labels2))

library(ggplot2)
ggplot(daten, aes(x=Reihe, y=Werte, fill=Reihe)) +
   geom_boxplot(width=0.36) +
   scale_fill_manual(
      values = c(
         "Server Push_CSS und _Bilder" = "#c90b0b",
         "Server Push_CSS" = "#3e4fc8"
      ),
      name=NULL,
      #Reihenfolge und Inhalt der Legendenelemte:
      limits=c("Server Push_CSS und _Bilder","Server Push_CSS"),
      #Text der Legendenelemente (Freitext, wird nicht überprüft!!!)
      labels= c("Server Push_CSS und _Bilder  ","Server Push_CSS")
   ) +
   #Reihenfolge der Boxplots ändern (von links nach rechts)
   scale_x_discrete(limits=c("Server Push_CSS", "Server Push_CSS und _Bilder"))+
   
   geom_text(data = labels, aes(y= labels$Werte, label = labels$Werte), hjust=0, nudge_x = 0.2, size= 9, angle= 45) +
  
   theme(
      axis.title = element_blank(),
      axis.text.y = element_blank(),
      #Schriftgröße X-Achse:
      axis.text.x = element_text(size=24),
      #Rand um die Das Plotfenster: oben, rechts, unten, links
      plot.margin = unit(c(0.5,0,0.5,0), "cm"),
      #Schriftformatierung Legendentitel
      legend.title = element_text(size = 24),
      #SChriftformatierung Legende
      legend.text = element_text(size=24, margin = 10),
      #Position Legende
      legend.position="bottom"
      
   ) +
   coord_flip()
   


