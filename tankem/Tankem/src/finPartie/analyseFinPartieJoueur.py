import math

class AnalyseFinPartieJoueur(object):
    def __init__(self, ancienExperience, f, vg, vp, gagner):
        self.ancienExperience = ancienExperience
        self.f = f
        self.vg = vg
        self.vp = vp
        self.gagner = gagner
        self.nouvelleExperience = 0
        self.experienceGagne = 0

    def calculAncienNiveau(self):
        if(self.ancienExperience > 250):
            delta = 2*2 - 4 * 1 * (2 - (self.ancienExperience/50))
            self.niveau = int(math.floor((-2+math.sqrt(delta))/(2)))
        else:
            self.niveau = 0

    def calculNouvelleExperience(self):
        self.experienceGagne = 0
        if(self.gagner):
            self.experienceGagne = 100 + 100 * self.f + 2 * self.vg 
        else:
            self.experienceGagne = 2 * self.vp

        self.nouvelleExperience = self.ancienExperience + self.experienceGagne
    
    def niveauAugmente(self):
        augmente = False
        seulExperience = 100 * (self.niveau + 2) + 50 * math.pow((self.niveau + 1) , 2)

        if(self.nouvelleExperience >= seulExperience):
            if(self.nouvelleExperience > 250):
                delta = 2*2 - 4 * 1 * (2 - (self.nouvelleExperience/50))
                self.niveau = int(math.floor((-2+math.sqrt(delta))/(2)))
            else:
                self.niveau = 0
            augmente = True
        
        return augmente
