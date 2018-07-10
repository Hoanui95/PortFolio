class DTO_Partie(object):
    def __init__(self, dateDebut, dateFin, idJoueurGagnant, idJoueurPerdant, niveauJoue, distanceJ1, distanceJ2, armeJ1, armeJ2):
        self.dateDebut = dateDebut
        self.dateFin = dateFin
        self.idJoueurGagnant = idJoueurGagnant
        self.idJoueurPerdant = idJoueurPerdant
        self.niveauJoue = niveauJoue
        self.distanceJ1 = distanceJ1
        self.distanceJ2 = distanceJ2
        self.armeJ1 = armeJ1
        self.armeJ2 = armeJ2